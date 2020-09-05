#!/bin/bash
#Author: Harrsimran Kaur
echo "Human Resource Management Menu"
echo "=============================="
echo
echo "E - Add New Employees"
echo "K - Add New Key Performance Indicator (KPI)"
echo "R - Performance Review"
echo
echo "Q - Quit / Exit from program"
echo
echo -n "Please enter your choice: "
read choice
case "$choice" in
[eE]) ./AddNewEmpForm.sh ;;
[kK]) ./AddNewKPIForm.sh ;;
[rR]) ./EmpPerfReviewForm.sh ;;
[qQ]) exit ;;
*) echo "Invalid Choice! Try Again" ;;
esac
