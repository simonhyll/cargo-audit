#!/bin/bash -l

# $1 = path
# $2 = fix
# $3 = deny

# Enter correct directory
cd "$1"

if [ "$3" == "false" ]; then
  # Should not deny
  DENY=""
else
  # Should deny
  DENY="-D $3"
fi

if [ "$2" == "false" ]; then
  # Should not fix
  FIX=""
else
  # Should fix
  FIX="fix"
fi

set +e
OUTPUT=$(cargo-audit audit $DENY $FIX)
RESULT=$?
set -e
WARNINGS=$(echo $OUTPUT | grep -c ID)

if [ $RESULT == 1 ] || [ $WARNINGS ]; then
  echo "::set-output name=warnings::true"
  if [ "$3" != "false" ]; then
    exit 1
  fi
else
  echo "::set-output name=warnings::false"
fi
