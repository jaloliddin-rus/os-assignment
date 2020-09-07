#!/bin/bash
#author: Harrsimran Kaur

#text color
RED='\033[0;31m'   #red
NC='\033[0m'       #default
GREEN='\033[0;32m' #green

clear

loop=1

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
while [[ $loop -eq 1 ]]; do
    echo -n "Please select a choice : "
    read choice
    case "$choice" in
    [pP])
        ./AddNewEmpForm.sh 'PD'
        loop=0
        ;;
    [uU])
        ./AddNewEmpForm.sh 'PU'
        loop=0
        ;;
    [sS])
        ./AddNewEmpForm.sh 'SM'
        loop=0
        ;;
    [hH])
        ./AddNewEmpForm.sh 'HR'
        loop=0
        ;;
    [aA])
        ./AddNewEmpForm.sh 'AF'
        loop=0
        ;;
    [iI])
        ./AddNewEmpForm.sh 'IT'
        loop=0
        ;;
    [qQ])
        ./HRMenu.sh
        loop=0
        ;;
    *)
        printf "${RED}Invalid Choice!\n${NC}"
        loop=1
        ;;
    esac
done
