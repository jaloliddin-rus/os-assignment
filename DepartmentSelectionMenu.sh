#!/bin/bash
#author: Harrsimran Kaur

#text color
RED='\033[0;31m'   #red
NC='\033[0m'       #default
GREEN='\033[0;32m' #green

clear

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
while true; do
    echo -n "Please select a choice : "
    read choice
    case "$choice" in
    [pP]) ./AddNewEmpForm.sh 'PD' ;;
    [uU]) ./AddNewEmpForm.sh 'PU' ;;
    [sS]) ./AddNewEmpForm.sh 'SM' ;;
    [hH]) ./AddNewEmpForm.sh 'HR' ;;
    [aA]) ./AddNewEmpForm.sh 'AF' ;;
    [iI]) ./AddNewEmpForm.sh 'IT' ;;
    [qQ]) ./HRMenu.sh ;;
    *) printf "${RED}Invalid Choice!\n${NC}" ;;
    esac
done
