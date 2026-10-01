import { createClient } from "redis";
import pg from "pg";

const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
const createTable = "CREATE TABLE IF NOT EXISTS votes (id serial PRIMARY KEY, vote text NOT NULL, at timestamptz NOT NULL DEFAULT now())";

const redis = createClient({ url: process.env.REDIS_URL || "redis://localhost:6379", socket: { reconnectStrategy: () => 2000 } });
redis.on("error", (e) => console.log("redis error:", e.message));
const db = new pg.Pool({ connectionString: process.env.DATABASE_URL, max: 2 });
db.on("error", (e) => console.log("db error:", e.message));
const version = process.env.WORKER_VERSION || "1";

process.on("SIGTERM", () => process.exit(0));

for (;;) {
  try {
    if (!redis.isOpen) await redis.connect();
    await db.query(createTable);
    break;
  } catch (e) {
    console.log("waiting for redis and postgres:", e.message);
    await sleep(2000);
  }
}
console.log(`worker version ${version} ready`);

for (;;) {
  let element = null;
  try {
    const item = await redis.blPop("votes", 5);
    if (!item) continue;
    element = item.element;
    const { vote } = JSON.parse(element);
    await db.query(createTable);
    await db.query("INSERT INTO votes (vote) VALUES ($1)", [vote]);
    element = null;
    console.log(`stored a vote for ${vote}`);
  } catch (e) {
    console.log("retrying after an error:", e.message);
    if (element) {
      await redis.lPush("votes", element).catch(() => {});
      console.log("put the vote back in the queue");
    }
    await sleep(2000);
  }
}
