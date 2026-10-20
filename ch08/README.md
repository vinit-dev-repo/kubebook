# 08 - Environment Variables and ConfigMaps; ConfigMap Files, Secrets and Secret Types; Secrets in Pods and Keeping Them Safe

The files the chapter **08**, in its parts **08.1 - Environment Variables and ConfigMaps**, **08.2 - ConfigMap Files, Secrets and Secret Types** and **08.3 - Secrets in Pods and Keeping Them Safe**, of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch08`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the part, the section heading and the line in that part where the file's text starts.

## What this chapter teaches

- Set environment variables with a fixed value, a Pod field, or a request or limit, and follow the `$(NAME)` and string rules
- Make a ConfigMap five ways, and read it back with `get`, `describe`, `-o yaml` and a template
- Give a container a ConfigMap as variables with `configMapKeyRef` and `envFrom`, and read single keys from an env file with `fileKeyRef`
- Mount a ConfigMap as files, pick keys with `items` and `subPath`, and tell which changes reach a running container on their own
- Mark a ConfigMap `immutable` and see why a changed file is not a changed application
- Store a Secret, see that base64 is encoding and not encryption, and read the value back three ways
- Pick the right Secret type for registry credentials, a certificate and a user name and password
- Use a Secret in a Pod as a variable and as files, and read the mode and the `tmpfs` mount of the volume
- Rotate a Secret, and read the two different failures of a missing object in a variable and in a volume
- Name each protection a Secret has and the step of its path that the protection guards

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `env.yaml` | 08.1 › Environment variables - three sources › In practice (line 82) |  |
| `envorder.yaml` | 08.1 › Environment variables - three sources › In practice (line 170) |  |
| `envnum.yaml` | 08.1 › Environment variables - three sources › In practice (line 204) |  |
| `app.properties` | 08.1 › ConfigMaps - making them › In practice (line 282) | written with printf |
| `db.env` | 08.1 › ConfigMaps - making them › In practice (line 313) | written with printf |
| `conf/main.conf` | 08.1 › ConfigMaps - making them › In practice (line 317) | written with printf |
| `conf/http.conf` | 08.1 › ConfigMaps - making them › In practice (line 318) | written with printf |
| `cm.yaml` | 08.2 › ConfigMap values as files › A changed file is not a changed application (line 198) | rewritten later in the chapter |
| `cm-settings.txt` | 08.1 › ConfigMaps - making them › In practice (line 488) | written with printf |
| `cm-calibration.bin` | 08.1 › ConfigMaps - making them › In practice (line 489) | written with printf |
| `cmenv.yaml` | 08.1 › ConfigMap values as environment variables › In practice (line 557) |  |
| `cmmissing.yaml` | 08.1 › ConfigMap values as environment variables › In practice (line 620) |  |
| `envfile.yaml` | 08.1 › Environment variables from a file › In practice (line 750) |  |
| `envnokey.yaml` | 08.1 › Environment variables from a file › In practice (line 809) |  |
| `cmvol.yaml` | 08.2 › ConfigMap values as files › In practice (line 59) |  |
| `deployment.yaml` | 08.2 › ConfigMap values as files › A changed file is not a changed application (line 214) |  |
| `cmimm.yaml` | 08.2 › ConfigMap values as files › Keep one configuration version immutable (line 387) |  |
| `sec.yaml` | 08.2 › Secrets - what they are and how to make them › In practice (line 551) |  |
| `secbad.yaml` | 08.2 › Secrets - what they are and how to make them › In practice (line 581) |  |
| `basic.yaml` | 08.2 › Secret types › In practice (line 727) |  |
| `basicbad.yaml` | 08.2 › Secret types › In practice (line 747) |  |
| `secpod.yaml` | 08.3 › Secrets into Pods › In practice (line 61) |  |
| `ex-greeter.yaml` | 08.3 › Try it yourself (line 302) |  |
| `ex.properties` | 08.3 › Try it yourself (line 335) | written with printf |
| `ex-reader.yaml` | 08.3 › Try it yourself (line 338) |  |
| `ex-reader3.yaml` | 08.3 › Try it yourself (line 380) |  |
| `ex-secret.yaml` | 08.3 › Try it yourself (line 417) |  |
| `ex-lonely.yaml` | 08.3 › Try it yourself (line 440) |  |
| `ex-shopweb.yaml` | 08.3 › Try it yourself (line 479) |  |
| `ex-filer.yaml` | 08.3 › Try it yourself (line 535) |  |
