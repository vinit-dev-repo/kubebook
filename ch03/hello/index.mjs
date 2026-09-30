import express from "express";
import os from "os";

const app = express();
const version = process.env.APP_VERSION || "1";

app.get("/", (req, res) => {
  res.send(`hello from ${os.hostname()} (version ${version})\n`);
});

const server = app.listen(3000, () => console.log("kubebook-hello listening on 3000"));
process.on("SIGTERM", () => server.close(() => process.exit(0)));
