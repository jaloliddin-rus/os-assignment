#!/bin/bash
#author: Jaloliddin
kpiDB="KPI.txt"
echo $1
echo $2
echo $3
echo $4
filename= "$1KPIResult"
echo "Employee Performance Review Form"
echo "------------------------"
echo -n "Please enter the KPI Code: "
read kpi

while IFS=: read -r kpiCode kpiCriteria kpiDesc; do
    if [[ $kpi == $kpiCode ]]; then
        echo "KPI - Key Performance Indicator: $kpiCriteria"
    fi
done <$kpiDB

echo -n "Plese enter the Rate obtained (max 10 - min 0): "
read rate

echo "Comments (if any): "
read comment

echo -n "Press (y) to continue to the Employee's marks or (b) to return to the previous screen: "
read choice
case $choice in
y) ./EmpPerfReviewForm.sh ;;
b) ./EmpValidationForm.sh ;;
*) echo -n "Invalid Choice!" ;;
esac
