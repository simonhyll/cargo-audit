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

## In a workflow

This is the most useful usecase. Just add it to a workflow and bam, your project gets audited and a pull request is created to push the fixes if any were made.

```yaml
    steps:
      - name: Run cargo audit fix
        uses: simonhyll/cargo-audit@v1
        with:
          path: "./" # (optional) Path to the folder that contains your Cargo.lock file
```

Here's an example full workflow.

```yaml
name: Audit project
on:
  workflow_dispatch:
  pull_request:
  push:
    branches:
      - main

jobs:
  audit:
    runs-on: ubuntu-latest
    permissions:
      contents: write
      pull-requests: write

    steps:
      - name: Run cargo audit fix
        uses: simonhyll/cargo-audit@v1

      - name: Create Pull Request
        uses: peter-evans/create-pull-request@v4
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          branch: bot/cargo-audit
          title: "[Bot] Audit fixes"
          commit-message: Cargo audit fixes
          body: >
            Updates to Cargo.toml and/or Cargo.lock with security fixes.
          labels: automated pr
```
