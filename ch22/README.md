# 22 - Reading the Stack and the App Image; Secrets, MySQL, Memcached and RabbitMQ; Init Containers, the Ingress, Operating the Stack and the Exercises

The files the chapter **22**, in its parts **22.1 - Reading the Stack and the App Image**, **22.2 - Secrets, MySQL, Memcached and RabbitMQ** and **22.3 - Init Containers, the Ingress, Operating the Stack and the Exercises**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch22`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Say where each part of a Compose stack goes on Kubernetes: a Deployment, a Service, a claim, a Secret, a ConfigMap or an Ingress
- Build a Tomcat WAR image in two stages, and change its `/ping` route so that a readiness probe can fail
- Keep three passwords in one Secret, write a Secret as base64 `data` or as `stringData`, and read the refusal of a bad value
- Run MySQL on a claim, with its schema in a ConfigMap and a readiness probe that waits for the real server
- Run Memcached with no volume, and RabbitMQ on a claim with a fixed Pod hostname
- Make the app wait for its backends with init containers that check a port, and put an Ingress in front
- Replace the MySQL and Memcached Pods, and roll out a wrong password with no outage
- Clean up in the right order

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `kind.yaml` | 22.1 › Reading the stack before moving it › In practice (line 102) |  |
| `app/src/main/resources/application.properties` | 22.1 › The app image › In practice (line 185) |  |
| `app/src/main/java/kubebook/ch22/StatusServlet.java` | 22.1 › The app image › In practice (line 210) |  |
| `app/pom.xml` | 22.1 › The app image › In practice (line 307) |  |
| `app/Dockerfile` | 22.1 › The app image › In practice (line 357) |  |
| `secret-demo.yaml` | 22.2 › Secrets and the database › In practice (line 120) |  |
| `secret-bad.yaml` | 22.2 › Secrets and the database › In practice (line 151) |  |
| `k8s/db.yaml` | 22.2 › Secrets and the database › In practice (line 186) |  |
| `k8s/cache.yaml` | 22.2 › The cache and the queue › In practice (line 371) |  |
| `k8s/queue.yaml` | 22.2 › The cache and the queue › In practice (line 404) |  |
| `k8s/app.yaml` | 22.3 › Starting in order, and the Ingress › In practice (line 79) |  |
| `k8s/ingress.yaml` | 22.3 › Starting in order, and the Ingress › In practice (line 316) |  |
| `patch.json` | 22.3 › Try it yourself (line 707) |  |
