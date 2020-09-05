#!/bin/bash
#author: Harrsimran Kaur

echo "Department Selection Menu"
echo "========================="
echo
echo "P - PD (Production Department)"
echo "U - PU (Purchasing Department)"
echo "S - SM (Sales and Marketing Department)"
echo "H - HR (Human Resource Department)"
echo "A - AF (Accounting and Finance Department)"
echo "I - IT (Information Technology Department)"
echo
echo "Q - Quit (Return to Human Resource Management Menu)"
echo
echo -n "Please select a choice : "
read choice
case "$choice" in
[pP]) ./AddNewEmpForm.sh
[uU]) ./AddNewEmpForm.sh
[sS]) ./AddNewEmpForm.sh
[hH]) ./AddNewEmpForm.sh
[aA]) ./AddNewEmpForm.sh
[iI]) ./AddNewEmpForm.sh
[qQ]) ./HRMenu.sh
*) echo "Invalid Choice!"
esac

