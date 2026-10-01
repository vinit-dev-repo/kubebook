# 22 - A Java Stack on Kubernetes - Tomcat, MySQL, Memcached, RabbitMQ, Secrets, Volumes and Ingress

Files this chapter writes in its blocks, extracted byte for byte from the certified chapter. The chapter itself explains every line; read it in the tutorial. The blocks `cat` these files into a work folder `~/kubebook-ch22`; cloning this folder there gives the same result.

- `kind.yaml`
- `app/src/main/resources/application.properties`
- `app/src/main/java/kubebook/ch22/StatusServlet.java`
- `app/pom.xml`
- `app/Dockerfile`
- `secret-demo.yaml`
- `secret-bad.yaml`
- `k8s/db.yaml`
- `k8s/cache.yaml`
- `k8s/queue.yaml`
- `k8s/app.yaml`
- `k8s/ingress.yaml`
- `patch.json`
