#!/bin/bash
#Author: Harrsimran Kaur
clear
printf "Human Resource Management Menu\n"
printf "==============================\n"
printf "E - Add New Employees\n"
printf "K - Add New Key Performance Indicator (KPI)\n"
printf "R - Performance Review\n"
printf "Q - Quit / Exit from program\n"
#while true; do
printf "Please enter your choice: "
read choice
case "$choice" in
[eE]) ./DepartmentSelectionMenu.sh ;;
[kK]) ./AddNewKPIForm.sh ;;
[rR]) ./EmpValidationForm.sh ;;
[qQ]) exit ;;
*) echo "Invalid Choice!" ;;
esac
#done
