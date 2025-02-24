#!/usr/bin/bash
for file in $(find /usr/bin); do
  if [ ! -x $file ]; then
    ls -l "$file"
  fi
done
