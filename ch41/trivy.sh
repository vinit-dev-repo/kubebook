docker run --rm -v kubebook-ch41-trivy:/root/.cache/trivy -v "$W:/work" -w /work aquasec/trivy:0.75.0 "$@"
