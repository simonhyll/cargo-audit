<div align="center">

#### (unofficial)

# Cargo Audit

### In a Docker image

</div>

## Getting started

If you inspect the Dockerfile you'll see that this is literally just a Docker image that contains cargo-audit in a distroless image. I created it to save time on installing it since cargo install is so slow.

```shell
# Build the image
docker build -t cargo-audit:latest .
# Run it
docker run --rm -v $(pwd):/app cargo-audit
```
