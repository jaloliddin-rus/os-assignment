#!/bin/bash
#author: Harrsimran Kaur
#Argument from DepartmentSelectionMenu script
empDepartment=$1

loop=y

while [ "$loop" = "y" ]; do
    echo "Add New Employee Form"
    echo "====================="
    echo
    echo -n "Employee IC. Number (000000-00-0000) : "
    read empICNo
    echo -n "Employee Name (Xxx Xxx) : "
    read empName
    echo -n "Contact Number (000-000000) : "
    read empContactNo
    echo -n "Email (test@test.com) : "
    read empEmail
    echo -n "Gender (Male/Female) : "
    read empGender
    echo -n "Birth Date (00-00-0000) : "
    read empBirthDate
    echo -n "Job Title : "
    read empJobTitle
    echo -n "Joined Date (00-00-0000) : "
    read empJoinedDate
    if [ -n "$empICNo" ] && [ -n "$empName" ] && [ -n "$empContactNo" ] && [ -n "$empEmail" ] && [ -n "$empGender" ] && [ -n "$empBirthDate" ] && [ -n "$empJobTitle" ] && [ -n "$empJoinedDate" ]; then
        echo "$empDepartment:$empICNo:$empName:$empContactNo:$empEmail:$empGender:$empBirthDate:$empJobTitle:$empJoinedDate" >>Employee.txt
    else
        echo "Incomplete Input!"
    fi
    echo -n "Add Another Employee? (y)es or (q)uit : "
    read loop
    if [[ $loop != "y" ]] && [[ $loop = "q" ]]; then
        echo "Press (q) to return to Human Resource Management Menu : "
        read choiceMenu
        case "$choiceMenu" in
        [qQ]) ./HRMenu.sh ;;
        *) echo "Invalid Choice!" ;;
        esac
    fi
done
