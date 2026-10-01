docker run --rm -u "$U" -v "$W:/work" -w /work -e HOME=/work -e TMPDIR=/work/tmp anchore/syft:v1.54.0 "$@"
