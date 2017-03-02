#!/usr/bin/env bash
NAME[0]="Shiblee"
NAME[1]="Gulshan"
NAME[2]="Anan"

length=${#NAME[@]}

for (( i=0; i<${length}; i++ )); do
    echo ${NAME[$i]}
done