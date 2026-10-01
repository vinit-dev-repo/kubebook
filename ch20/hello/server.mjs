import { createServer } from "node:http";
import { hostname } from "node:os";

const version = process.env.APP_VERSION || "1";

createServer((req, res) => {
  if (req.url === "/healthz") { res.end("ok\n"); return; }
  res.setHeader("Content-Type", "text/plain");
  res.end(`hello from ${hostname()} version ${version}\n`);
}).listen(3000, () => console.log("hello listening on 3000"));

process.on("SIGTERM", () => process.exit(0));
