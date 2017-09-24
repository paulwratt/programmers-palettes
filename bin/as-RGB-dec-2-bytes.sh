#!/bin/sh
printf "$(printf '\\%o\\%o\\%o' $@)"
