import { createServer } from "node:http";
import { hostname } from "node:os";
import { createClient } from "redis";

const redis = createClient({ url: process.env.REDIS_URL || "redis://localhost:6379", disableOfflineQueue: true });
redis.on("error", (e) => console.log("redis error:", e.message));
redis.connect().catch(() => {});

const page = (msg) => `<html><body><h1>Cats or dogs?</h1><form method="POST"><button name="vote" value="cats">Cats</button> <button name="vote" value="dogs">Dogs</button></form><p>${msg}</p><p>served by ${hostname()}</p></body></html>\n`;

createServer(async (req, res) => {
  if (req.url === "/healthz") {
    if (redis.isReady) { res.end("ok\n"); } else { res.statusCode = 503; res.end("no redis\n"); }
    return;
  }
  res.setHeader("Content-Type", "text/html");
  if (req.method === "POST") {
    let body = "";
    for await (const chunk of req) body += chunk;
    const vote = new URLSearchParams(body).get("vote");
    if (vote !== "cats" && vote !== "dogs") { res.statusCode = 400; res.end(page("cats or dogs only")); return; }
    try {
      await redis.rPush("votes", JSON.stringify({ vote, at: Date.now() }));
      res.end(page(`you voted ${vote}`));
    } catch (e) {
      res.statusCode = 503;
      res.end(page("the vote could not be stored, try again"));
    }
    return;
  }
  res.end(page("no vote yet"));
}).listen(80, () => console.log("vote listening on 80"));

process.on("SIGTERM", () => process.exit(0));
