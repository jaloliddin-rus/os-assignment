#!/bin/bash
#author: Harrsimran Kaur

clear
kpiDB="KPI.txt"
counter=1
if [[ -s "$kpiDB" ]]; then
    while IFS=: read -r kpiCode kpiEvaluation kpiDescription; do
        counter=$(($counter + 1))
        echo $counter
    done <$kpiDB
fi

if [[ $counter -lt 10 ]]; then
    kpiCode=$(printf "KPI_%02d" "$counter")
    echo $kpiCode
fi
