import json, ssl
from http.server import BaseHTTPRequestHandler, HTTPServer
class H(BaseHTTPRequestHandler):
    def do_POST(self):
        review = json.loads(self.rfile.read(int(self.headers["Content-Length"])))
        req = review["request"]
        labels = req["object"]["metadata"].get("labels") or {}
        allowed = "team" in labels
        resp = {"uid": req["uid"], "allowed": allowed}
        if not allowed:
            resp["status"] = {"code": 403, "message": "every Pod in this namespace needs a team label"}
        body = json.dumps({"apiVersion": "admission.k8s.io/v1", "kind": "AdmissionReview", "response": resp}).encode()
        self.send_response(200); self.send_header("Content-Type", "application/json"); self.end_headers(); self.wfile.write(body)
        print("reviewed", req["object"]["metadata"].get("name") or req["object"]["metadata"].get("generateName"), "allowed" if allowed else "denied", flush=True)
    def log_message(self, *a): pass
srv = HTTPServer(("", 8443), H)
ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER); ctx.load_cert_chain("/certs/tls.crt", "/certs/tls.key")
srv.socket = ctx.wrap_socket(srv.socket, server_side=True)
print("webhook listening", flush=True)
srv.serve_forever()
