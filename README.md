<div align="center">

#### (unofficial)

# Cargo Audit

### In a Docker image

</div>

## Getting started

If you inspect the Dockerfile you'll see that this is literally just a Docker image that contains cargo-audit in a distroless image. I created it to save time on installing it since cargo install is so slow.

The image runs `cargo audit fix`.

```shell
# Pull the image
docker pull ghcr.io/simonhyll/cargo-audit
# Run it in your crate
docker run --rm -v $(pwd):/app ghcr.io/simonhyll/cargo-audit
# Or, on Windows, because $(pwd) wont work there to mount the current working directory
docker run --rm -v %cd%:/app ghcr.io/simonhyll/cargo-audit

# Or you can build and run it yourself

# Clone the repository
git clone https://github.com/simonhyll/cargo-audit
cd cargo-audit
# Build the image
docker build -t cargo-audit:latest .
# Run it in your crate
docker run --rm -v $(pwd):/app cargo-audit
```
