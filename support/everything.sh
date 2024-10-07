#!/usr/bin/env bash

echo "module $(echo "${1}" | sed "sa/a.ag").Everything where" > src-zh/${1}/Everything.agda

find src-zh/${1} -type f -name '*.lagda.md' | \
  grep -v "Everything" | sort | \
  sed -re 's@src-zh/@@g;s@.lagda.md@@g;s@/@.@g;s@^@open import @g;s@$@ public@g' \
  >> src-zh/${1}/Everything.agda