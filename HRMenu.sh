#!/bin/bash
#Author: Harrsimran Kaur
echo "Human Resource Management Menu"
echo "=============================="
echo "E - Add New Employees"
echo "K - Add New Key Performance Indicator (KPI)"
echo "R - Performance Review"
echo
echo "Q - Quit / Exit from program"
echo
echo -n "Please enter your choice: ";
case "$choice" in
[eE]) ./AddNewEmp;;
[kK]) ./AddNewKPI;;
[rR]) ./PerformanceRev;;
[qQ]) exit;;
*) echo "Invalid Choice!"
esac