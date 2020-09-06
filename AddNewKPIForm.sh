#!/bin/bash
#author: Harrsimran Kaur

kpiDB="KPI.txt"
last_line=$(wc -l <$kpiDB)
current_line=0
if [[ -s "$kpiDB" ]]; then
    while IFS=: read -r kpiCode kpiEvaluation kpiDescription; do

        if [[ $current_line -eq $last_line ]]; then

            kpiNumber=${kpiCode##*\_}
            echo $kpiNumber

            kpiNumber=$(($kpiNumber + 1))
            echo $kpiNumber
            kpiCode=$(printf "KPI_%02d" "$kpiNumber")

        else
            kpiCode="KPI_01"

        fi
        current_line=$(($current_line + 1))
    done <$kpiDB
fi

echo $kpiCode
