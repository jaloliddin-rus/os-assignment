#!/bin/bash
#Author: Harrsimran Kaur
clear
loop=1

printf "Human Resource Management Menu\n"
printf "==============================\n"
printf "E - Add New Employees\n"
printf "K - Add New Key Performance Indicator (KPI)\n"
printf "R - Performance Review\n"
printf "Q - Quit / Exit from program\n"
while [[ $loop -eq 1 ]]; do
    printf "Please enter your choice: "
    read choice
    case "$choice" in
    [eE])
        ./DepartmentSelectionMenu.sh
        loop=0
        ;;
    [kK])
        ./AddNewKPIForm.sh
        loop=0
        ;;
    [rR])
        ./EmpValidationForm.sh
        loop=0
        ;;
    [qQ]) exit ;;
    *)
        printf "Invalid Choice!\n"
        loop=1
        ;;
    esac
done
