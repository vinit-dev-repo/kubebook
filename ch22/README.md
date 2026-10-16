# 22 - A Java Stack on Kubernetes - Tomcat, MySQL, Memcached, RabbitMQ, Secrets, Volumes and Ingress

The files the chapter **22 - A Java Stack on Kubernetes - Tomcat, MySQL, Memcached, RabbitMQ, Secrets, Volumes and Ingress** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch22`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

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
| `kind.yaml` | Reading the stack before moving it › In practice (line 104) |  |
| `app/src/main/resources/application.properties` | The app image › In practice (line 176) |  |
| `app/src/main/java/kubebook/ch22/StatusServlet.java` | The app image › In practice (line 198) |  |
| `app/pom.xml` | The app image › In practice (line 296) |  |
| `app/Dockerfile` | The app image › In practice (line 346) |  |
| `secret-demo.yaml` | Secrets and the database › In practice (line 448) |  |
| `secret-bad.yaml` | Secrets and the database › In practice (line 479) |  |
| `k8s/db.yaml` | Secrets and the database › In practice (line 514) |  |
| `k8s/cache.yaml` | The cache and the queue › In practice (line 689) |  |
| `k8s/queue.yaml` | The cache and the queue › In practice (line 722) |  |
| `k8s/app.yaml` | Starting in order, and the Ingress › In practice (line 885) |  |
| `k8s/ingress.yaml` | Starting in order, and the Ingress › In practice (line 1121) |  |
| `patch.json` | Try it yourself (line 1479) |  |
