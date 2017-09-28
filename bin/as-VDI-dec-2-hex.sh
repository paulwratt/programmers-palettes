#!/bin/sh
printf "$(printf '%04X %04X %04X' $@)\n"
