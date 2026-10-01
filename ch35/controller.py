import json, os, ssl, time, urllib.request
API = "https://kubernetes.default.svc"
SA = "/var/run/secrets/kubernetes.io/serviceaccount"
TOKEN = open(SA + "/token").read()
NS = open(SA + "/namespace").read()
CTX = ssl.create_default_context(cafile=SA + "/ca.crt")
def call(method, path, body=None, ctype="application/json"):
    req = urllib.request.Request(API + path, method=method, data=None if body is None else json.dumps(body).encode())
    req.add_header("Authorization", "Bearer " + TOKEN)
    req.add_header("Content-Type", ctype)
    try:
        with urllib.request.urlopen(req, context=CTX) as r:
            return r.status, json.loads(r.read() or b"{}")
    except urllib.error.HTTPError as e:
        return e.code, {}
print("controller started", flush=True)
while True:
    code, lst = call("GET", f"/apis/kubebook.example.com/v1/namespaces/{NS}/greetings")
    for g in lst.get("items", []):
        name = g["metadata"]["name"]
        text = " ".join([g["spec"]["message"]] * g["spec"].get("times", 1))
        cm = {"apiVersion": "v1", "kind": "ConfigMap",
              "metadata": {"name": "greeting-" + name,
                           "ownerReferences": [{"apiVersion": "kubebook.example.com/v1", "kind": "Greeting",
                                                "name": name, "uid": g["metadata"]["uid"]}]},
              "data": {"text": text}}
        c, _ = call("POST", f"/api/v1/namespaces/{NS}/configmaps", cm)
        if c == 409:
            c, _ = call("PUT", f"/api/v1/namespaces/{NS}/configmaps/greeting-" + name, cm)
        if c in (200, 201) and g.get("status", {}).get("phase") != "Ready":
            call("PATCH", f"/apis/kubebook.example.com/v1/namespaces/{NS}/greetings/{name}/status",
                 {"status": {"phase": "Ready"}}, "application/merge-patch+json")
            print("reconciled", name, flush=True)
    time.sleep(2)
