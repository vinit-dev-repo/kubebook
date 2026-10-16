"""Chapter 35's TLS review server with one additional default-only mutation path."""

import base64
import json
import ssl
from http.server import BaseHTTPRequestHandler, HTTPServer
from urllib.parse import urlsplit


def answer(path, review):
    if review["apiVersion"] != "admission.k8s.io/v1" or review["kind"] != "AdmissionReview":
        raise ValueError("expected an admission.k8s.io/v1 AdmissionReview")
    request = review["request"]
    obj = request["object"]
    labels = obj["metadata"].get("labels") or {}
    response = {"uid": request["uid"], "allowed": True}

    if path == "/validate":
        response["allowed"] = "team" in labels
        if not response["allowed"]:
            response["status"] = {
                "code": 403,
                "message": "every Pod in this namespace needs a team label",
            }
    elif path == "/mutate":
        if "kubebook-origin" not in labels:
            if obj["metadata"].get("labels") is None:
                patch = [{"op": "add", "path": "/metadata/labels",
                          "value": {"kubebook-origin": "webhook"}}]
            else:
                patch = [{"op": "add", "path": "/metadata/labels/kubebook-origin",
                          "value": "webhook"}]
            response["patchType"] = "JSONPatch"
            response["patch"] = base64.b64encode(
                json.dumps(patch, separators=(",", ":")).encode("utf-8")
            ).decode("ascii")
    else:
        raise ValueError("unknown webhook path")

    return {"apiVersion": review["apiVersion"], "kind": review["kind"],
            "response": response}


class Handler(BaseHTTPRequestHandler):
    def do_POST(self):
        route = urlsplit(self.path).path
        if route not in {"/validate", "/mutate"}:
            self.send_error(404)
            return
        try:
            size = int(self.headers["Content-Length"])
            if size < 0 or size > 1024 * 1024:
                raise ValueError("review too large")
            review = json.loads(self.rfile.read(size))
            result = answer(route, review)
        except (KeyError, TypeError, ValueError, json.JSONDecodeError):
            self.send_error(400)
            return
        body = json.dumps(result).encode("utf-8")
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)
        metadata = review["request"]["object"]["metadata"]
        name = metadata.get("name") or metadata.get("generateName")
        if route == "/validate":
            # Preserve the earlier lesson's validating handler and log behavior.
            print("reviewed", name,
                  "allowed" if result["response"]["allowed"] else "denied", flush=True)
        else:
            print("mutated", name,
                  "patched" if result["response"].get("patch") else "unchanged", flush=True)

    def log_message(self, *args):
        pass


if __name__ == "__main__":
    server = HTTPServer(("", 8443), Handler)
    context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
    context.load_cert_chain("/certs/tls.crt", "/certs/tls.key")
    server.socket = context.wrap_socket(server.socket, server_side=True)
    print("webhook listening", flush=True)
    server.serve_forever()
