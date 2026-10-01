const express = require("express");
const { Pool } = require("pg");
const { createClient } = require("redis");

const app = express();
app.use(express.json());
const api = express.Router();

const pg = new Pool({
  host: process.env.PGHOST,
  user: process.env.PGUSER,
  password: process.env.PGPASSWORD,
  database: process.env.PGDATABASE,
  port: 5432,
});
pg.on("error", (err) => console.log(`postgres pool error: ${err.code || err.message}`));
const redis = createClient({ url: `redis://${process.env.REDIS_HOST}:6379`, disableOfflineQueue: true });
redis.on("error", (err) => console.log(`redis error: ${err.message}`));

api.get("/healthz", (req, res) => (redis.isReady ? res.send("ok") : res.status(503).send("no redis")));

api.get("/values/all", async (req, res) => {
  const result = await pg.query("SELECT number FROM values ORDER BY number");
  res.json(result.rows.map((row) => row.number));
});

api.get("/values/current", async (req, res) => {
  const values = await redis.hGetAll("values");
  res.json(values);
});

api.post("/values", async (req, res) => {
  const index = req.body?.index;
  if (!Number.isInteger(index) || index < 0 || index > 40) {
    return res.status(422).send("invalid index");
  }
  await pg.query("INSERT INTO values(number) VALUES($1) ON CONFLICT DO NOTHING", [index]);
  await redis.hSet("values", String(index), "pending");
  await redis.publish("insert", String(index));
  res.send("working");
});

(async () => {
  let ready = false;
  for (let attempt = 1; attempt <= 30; attempt++) {
    try {
      await pg.query("CREATE TABLE IF NOT EXISTS values (number INT PRIMARY KEY)");
      ready = true;
      break;
    } catch (err) {
      console.log(`postgres not ready (attempt ${attempt}): ${err.code || err.message}`);
      await new Promise((r) => setTimeout(r, 1000));
    }
  }
  if (!ready) {
    console.log("postgres never answered; giving up");
    process.exit(1);
  }
  await redis.connect();
  app.use("/api", api);
  app.use(api);
  app.listen(5000, () => console.log("server listening on 5000"));
})();
