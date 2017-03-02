#!/usr/bin/env bash
foo=( )
foo[0]="bar"
foo[35]="baz"

for i in "${!foo[@]}"; do
    printf "%s\t%s\n" "$i" "${foo[$i]}"
done