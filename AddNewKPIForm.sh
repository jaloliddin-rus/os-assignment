#!/bin/bash
#author: Harrsimran Kaur
loop=y

while [ "$loop" = "y" ]; do
echo "Add New Key Performance Indicator (KPI) Form"
echo "============================================"
echo 
echo -n "KPI Code (Auto generated) : "
echo -n "KPI Evaluation Criteria   : "
read evaluationCriteriaKPI
echo -n "Description               : "
read descriptionKPI
echo

echo "$evaluationCriteriaKPI:$descriptionKPI" >> KPI.txt
echo -n "Add Another KPI? (y)es or (q)uit : "
read loop
if [[$loop != "y"]] && [[$loop = "q" ]]; then
echo "Press (q) to return to Human Resource Management Menu"
read choice
case $choice in
[qQ]) ./HRMenu.sh ;;
*) echo "Invalid Choice!" ;;
esac
fi
done
