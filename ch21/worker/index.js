const { createClient } = require("redis");

const store = createClient({ url: `redis://${process.env.REDIS_HOST}:6379` });
const sub = createClient({ url: `redis://${process.env.REDIS_HOST}:6379` });
store.on("error", (err) => console.log(`redis error: ${err.message}`));
sub.on("error", (err) => console.log(`redis error: ${err.message}`));

function fib(n) {
  return n < 2 ? 1 : fib(n - 1) + fib(n - 2);
}

(async () => {
  await store.connect();
  await sub.connect();
  await sub.subscribe("insert", async (message) => {
    await store.hSet("values", message, String(fib(Number(message))));
    console.log(`worker: fib(${message}) done`);
  });
  console.log("worker subscribed");
})();
