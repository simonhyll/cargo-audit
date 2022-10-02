#!/bin/sh -l

/usr/local/bin/cargo-audit -f "$1" fix

echo "::set-output name=warnings::false"
echo "::set-output name=critial::false"
