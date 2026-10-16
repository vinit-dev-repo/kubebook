# 08 - Configuration - Environment Variables, ConfigMaps and Secrets

The files the chapter **08 - Configuration - Environment Variables, ConfigMaps and Secrets** of the Kubernetes tutorial writes in its command blocks, copied byte for byte from the chapter. The blocks write them into the work folder `~/kubebook-ch08`; cloning this folder there gives the same files. The chapter explains every line; the table says where each file is written: the section heading and the line where the file's text starts.

## What this chapter teaches

- Set environment variables with a fixed value, a Pod field, or a request or limit, and follow the `$(NAME)` and string rules
- Make a ConfigMap five ways, and read it back with `get`, `describe`, `-o yaml` and a template
- Give a container a ConfigMap as variables with `configMapKeyRef` and `envFrom`, and as files with a `configMap` volume
- Tell which changes reach a running container on their own and which need a restart
- Store a Secret, see that base64 is encoding and not encryption, and read the value back three ways
- Pick the right Secret type, and use Secrets in a Pod as variables and as files
- Rotate a Secret, and read the two different failures of a missing object in a variable and in a volume
- Name each protection a Secret has and the step of its path that the protection guards

## Files

| File | Where it is in the chapter | Note |
|---|---|---|
| `env.yaml` | Environment variables - three sources › In practice (line 85) |  |
| `envorder.yaml` | Environment variables - three sources › In practice (line 173) |  |
| `envnum.yaml` | Environment variables - three sources › In practice (line 207) |  |
| `app.properties` | ConfigMaps - making them › In practice (line 281) | written with printf |
| `db.env` | ConfigMaps - making them › In practice (line 313) | written with printf |
| `conf/main.conf` | ConfigMaps - making them › In practice (line 317) | written with printf |
| `conf/http.conf` | ConfigMaps - making them › In practice (line 318) | written with printf |
| `cm.yaml` | ConfigMap values as files › A changed file is not a changed application (line 1032) | rewritten later in the chapter |
| `cm-settings.txt` | ConfigMaps - making them › In practice (line 494) | written with printf |
| `cm-calibration.bin` | ConfigMaps - making them › In practice (line 495) | written with printf |
| `cmenv.yaml` | ConfigMap values as environment variables › In practice (line 557) |  |
| `cmmissing.yaml` | ConfigMap values as environment variables › In practice (line 618) |  |
| `envfile.yaml` | Environment variables from a file › In practice (line 738) |  |
| `envnokey.yaml` | Environment variables from a file › In practice (line 798) |  |
| `cmvol.yaml` | ConfigMap values as files › In practice (line 890) |  |
| `deployment.yaml` | ConfigMap values as files › A changed file is not a changed application (line 1048) |  |
| `cmimm.yaml` | ConfigMap values as files › Keep one configuration version immutable (line 1227) |  |
| `sec.yaml` | Secrets - what they are and how to make them › In practice (line 1388) |  |
| `secbad.yaml` | Secrets - what they are and how to make them › In practice (line 1418) |  |
| `basic.yaml` | Secret types › In practice (line 1563) |  |
| `basicbad.yaml` | Secret types › In practice (line 1583) |  |
| `secpod.yaml` | Secrets into Pods › In practice (line 1639) |  |
| `ex-greeter.yaml` | Try it yourself (line 1877) |  |
| `ex.properties` | Try it yourself (line 1910) | written with printf |
| `ex-reader.yaml` | Try it yourself (line 1913) |  |
| `ex-reader3.yaml` | Try it yourself (line 1955) |  |
| `ex-secret.yaml` | Try it yourself (line 1992) |  |
| `ex-lonely.yaml` | Try it yourself (line 2015) |  |
| `ex-shopweb.yaml` | Try it yourself (line 2054) |  |
| `ex-filer.yaml` | Try it yourself (line 2110) |  |
