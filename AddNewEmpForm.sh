#!/bin/bash
#author: Harrsimran Kaur
loop=y

while [ "$loop" = "y" ]; do
    echo "Add New Employee Form"
    echo "====================="
    echo
    echo -n "Employee IC. Number : "
    read empICNo
    echo -n "Employee Name : "
    read empName
    echo -n "Contact Number : "
    read empContactNo
    echo -n "Email : "
    read empEmail
    echo -n "Gender : "
    read empGender
    echo -n "Birth Date : "
    read empBirthDate
    echo -n "Job Title : "
    read empJobTitle
    echo -n "Joined Date : "
    read empJoinedDate
    if [ -n "$empICNo" ] && [ -n "$empName" ] && [ -n "$empContactNo" ] && [ -n "$empEmail" ] && [ -n "$empGender" ] && [ -n "$empBirthDate" ] && [ -n "$empJobTitle" ] && [ -n "$empJoinedDate" ]; then
        echo "$empICNo:$empName:$empContactNo:$empEmail:$empGender:$empBirthDate:$empJobTitle:$empJoinedDate" >>Employee.txt
    else
        echo "Incomplete Input!"
    fi
    echo -n "Add Another Employee? (y)es or (q)uit : "
    read loop
    if [[ $loop != "y" ]] && [[ $loop = "q" ]]; then
        echo "Press (q) to return to Human Resource Management Menu"
        read choiceMenu
        case "$choiceMenu" in
        [qQ]) ./HRMenu.sh ;;
        *) echo "Invalid Choice!" ;;
        esac
    fi
done
