docker run --rm -u "$U" --network kubebook-ch41-net -v "$W:/work" -w /work -e HOME=/work -e COSIGN_PASSWORD="${COSIGN_PASSWORD:-kubebook-not-a-real-one-41}" ghcr.io/sigstore/cosign/cosign:v3.1.3 "$@"
