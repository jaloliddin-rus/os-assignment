#!/bin/bash
#author: Jaloliddin

clear

#variables passed down from another script
ICNo=$1
empName=$2
startDate=$3
endDate=$4

#text color
RED='\033[0;31m'   #red
NC='\033[0m'       #default
GREEN='\033[0;32m' #green

#files
kpiDB="KPI.txt"
filename="${ICNo}KPIResult"

#variables
loop=y
average=0.0
totalRate=0
counter=0

printf '%-50sEmployee Performance Review\n' >>$filename.txt
printf '%-50s===========================\n\n' >>$filename.txt
printf 'Employee IC. Number: %s\n' "$ICNo" >>$filename.txt
printf 'Employee Name: %s\n' "$empName" >>$filename.txt
printf 'Review Period: From %s To %s \n' "$startDate" "$endDate" >>$filename.txt
printf '%s======================================================================================\n' >>$filename.txt
printf '%-30s %-30s %-30s\n' "KPI Criteria:" "Rate Obtained:" "Comments:" >>$filename.txt
printf '%s======================================================================================\n' >>$filename.txt

while [[ "$loop" = "y" ]]; do
    clear
    echo "Employee Performance Review Form"
    echo "--------------------------------"
    echo -n "Please enter the KPI Code: "
    read kpi

    #loop to retrieve the kpi criteria based on kpi code
    while IFS=: read -r kpiCode kpiCriteria kpiDesc; do
        if [[ $kpi == $kpiCode ]]; then
            echo "KPI - Key Performance Indicator: $kpiCriteria"
            printCriteria=$kpiCriteria
        fi
    done <$kpiDB

    printf "Plese enter the Rate obtained (max 10 - min 0): "
    read rate
    while [[ $rate -lt 0 || $rate -gt 10 ]]; do

        if [[ $rate -lt 0 || $rate -gt 10 ]]; then
            printf "${RED}Invalid Marks Range!\n${NC}"
        fi

        printf "Plese enter the Rate obtained (max 10 - min 0): "
        read rate
    done

    totalRate=$((totalRate + rate))
    counter=$((counter + 1))

    echo -n "Comments (if any): "
    read comment

    printf '%-30s %-30s %-30s\n' "$printCriteria" "$rate" "$comment" >>$filename.txt

    printf "Press ${GREEN}(y)${NC} to continue to the Employee's marks or \n${RED}(b)${NC} to return to the previous screen: "
    read loop
done

if [[ $loop = "b" ]]; then
    average=$(($totalRate / counter))

    printf '%s\n' >>$filename.txt
    printf 'Average Performance Rating Score: %s\n' "$average" >>$filename.txt

    if [[ $average -ge 8 && $average -le 10 ]]; then
        printf '%s\n' >>$filename.txt
        printf 'Overall staff performacne: Outstanding' >>$filename.txt
    elif [[ $average -ge 6 && $average -le 7 ]]; then
        printf '%s\n' >>$filename.txt
        printf 'Overall staff performacne: Very Satisfactory' >>$filename.txt
    elif [[ $average -ge 4 && $average -le 5 ]]; then
        printf '%s\n' >>$filename.txt
        printf 'Overall staff performacne: Satisfactory' >>$filename.txt
    elif [[ $average -eq 3 ]]; then
        printf '%s\n' >>$filename.txt
        printf 'Overall staff performacne: Unsatisfactory' >>$filename.txt
    elif [[ $average -ge 0 && $average -le 2 ]]; then
        printf '%s\n' >>$filename.txt
        printf 'Overall staff performacne: Poor' >>$filename.txt
    fi

fi

case $loop in
b) ./EmpValidationForm.sh ;;
*) echo -n "Invalid Choice!" ;;
esac
