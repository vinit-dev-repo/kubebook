import { createServer } from "node:http";
import { hostname } from "node:os";

const target = process.env.NGINX_URL || "http://kubebook-ch20-nginx";

createServer(async (req, res) => {
  res.setHeader("Content-Type", "text/plain");
  if (req.url === "/nginx") {
    try {
      const r = await fetch(target, { signal: AbortSignal.timeout(2000) });
      const body = await r.text();
      res.end(`web-to-nginx on ${hostname()} got ${r.status} from ${target}: ${body.trim()}\n`);
    } catch (e) {
      res.statusCode = 502;
      res.end(`web-to-nginx on ${hostname()} could not reach ${target}: ${e.cause ? e.cause.code : e.message}\n`);
    }
    return;
  }
  res.end(`web-to-nginx on ${hostname()}\n`);
}).listen(3000, () => console.log("web-to-nginx listening on 3000"));

process.on("SIGTERM", () => process.exit(0));
