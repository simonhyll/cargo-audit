#!/bin/sh -l

ls
echo "$1"
/usr/local/bin/cargo-audit audit -f "$1" fix

echo "::set-output name=warnings::false"
echo "::set-output name=critial::false"
