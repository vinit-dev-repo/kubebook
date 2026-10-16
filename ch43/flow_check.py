"""Require one exact generated TCP flow in Hubble's JSON output."""

import json
import sys
from pathlib import Path

path, namespace = Path(sys.argv[1]), sys.argv[2]
for line in path.read_text(encoding="utf-8").splitlines():
    if not line.startswith("{"):
        continue
    item = json.loads(line)
    flow = item.get("flow", item)
    source = flow.get("source") or {}
    destination = flow.get("destination") or {}
    tcp = (flow.get("l4") or {}).get("TCP") or {}
    if (
        source.get("namespace") == namespace
        and source.get("pod_name") == "dns-client"
        and destination.get("namespace") == namespace
        and destination.get("pod_name") == "dns-allowed"
        and int(tcp.get("destination_port", -1)) == 8080
        and flow.get("verdict") == "FORWARDED"
    ):
        print(f"source={namespace}/dns-client destination={namespace}/dns-allowed "
              "protocol=TCP:8080 verdict=FORWARDED")
        raise SystemExit(0)
print("No exact forwarded client-to-allowed TCP/8080 flow", file=sys.stderr)
raise SystemExit(1)
