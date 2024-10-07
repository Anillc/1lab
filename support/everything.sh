#!/usr/bin/env bash

echo "module $(echo "${1}" | sed "sa/a.ag").Everything where" > src-translated/${1}/Everything.agda

find src-translated/${1} -type f -name '*.lagda.md' | \
  grep -v "Everything" | sort | \
  sed -re 's@src-translated/@@g;s@.lagda.md@@g;s@/@.@g;s@^@open import @g;s@$@ public@g' \
  >> src-translated/${1}/Everything.agda