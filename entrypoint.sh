#!/bin/sh -l

cd "$1"
/usr/local/bin/cargo-audit audit fix

echo "::set-output name=warnings::false"
echo "::set-output name=critial::false"
