#!/bin/bash
#Author: Harrsimran Kaur
clear
echo "Human Resource Management Menu"
echo "=============================="
echo
echo "E - Add New Employees"
echo "K - Add New Key Performance Indicator (KPI)"
echo "R - Performance Review"
echo
echo "Q - Quit / Exit from program"
echo
while true; do
    echo -n "Please enter your choice: "
    read choice
    case "$choice" in
    [eE]) ./DepartmentSelectionMenu.sh ;;
    [kK]) ./AddNewKPIForm.sh ;;
    [rR]) ./EmpValidationForm.sh ;;
    [qQ]) exit ;;
    *) echo "Invalid Choice!" ;;
    esac
done
