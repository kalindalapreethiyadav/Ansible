#!/bin/bash
find . -maxdepth 1 -size +2G | while read file; do
echo "$file is too large = $(stat -c%s "$file") bytes."
exit
