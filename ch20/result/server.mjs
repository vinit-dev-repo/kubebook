import { createServer } from "node:http";
import { hostname } from "node:os";
import pg from "pg";

const db = new pg.Pool({ connectionString: process.env.DATABASE_URL, max: 2 });
db.on("error", (e) => console.log("db error:", e.message));

createServer(async (req, res) => {
  try {
    const r = await db.query("SELECT vote, count(*)::int AS n FROM votes GROUP BY vote ORDER BY vote");
    const counts = Object.fromEntries(r.rows.map((x) => [x.vote, x.n]));
    if (req.url === "/healthz") { res.end("ok\n"); return; }
    res.setHeader("Content-Type", "application/json");
    res.end(JSON.stringify({ cats: counts.cats || 0, dogs: counts.dogs || 0, served_by: hostname() }) + "\n");
  } catch (e) {
    res.statusCode = 503;
    res.end(`no results yet: ${e.message}\n`);
  }
}).listen(80, () => console.log("result listening on 80"));

process.on("SIGTERM", () => process.exit(0));
