# Cargo Audit (unofficial)

### In a Docker image

## Getting started

```shell
# Build the image
docker build -t cargo-audit:latest .
# Run it
docker run --rm -v $(pwd):/app cargo-audit
```
