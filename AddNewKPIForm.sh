#!/bin/bash
#author: Harrsimran Kaur
clear
loop=y
kpiDB="KPI.txt"
counter=1
if [[ -s "$kpiDB" ]]; then
    while IFS=: read -r kpiCode kpiEvaluation kpiDescription; do
        counter=$(($counter + 1))
        #echo $counter
    done <$kpiDB
fi

if [[ $counter -lt 10 ]]; then
    kpiCode=$(printf "KPI_%02d" "$counter")
    #echo $kpiCode
fi

while [ "$loop" = "y" ]; do
    clear
    echo "Add New Key Performance Indicator (KPI) Form"
    echo "============================================"
    echo "KPI Code (Auto Generated) : $kpiCode"
    echo -n "KPI Evaluation Criteria : "
    read kpiEvCriteria
    echo -n "Description : "
    read kpiDescription
    if [ -n "$kpiEvCriteria" ] && [ -n "$kpiDescription" ]; then
        echo "$kpiCode:$kpiEvCriteria:$kpiDescription" >>KPI.txt
    else
        echo "Incomplete Input!"
    fi
    echo -n "Add Another KPI? (y)es or (q)uit : "
    read loop
    if [[ $loop != "y" ]] && [[ $loop = "q" ]]; then
        echo -n "Press (q) to return to Human Resource Management Menu : "
        read choiceMenu
        case "$choiceMenu" in
        [qQ]) ./HRMenu.sh ;;
        *) echo "Invalid Choice!" ;;
        esac
    fi
done
