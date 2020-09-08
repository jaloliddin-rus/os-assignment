#!/bin/bash
#author: Harrsimran Kaur
clear

#constants
declare -r TRUE=0
declare -r FALSE=1

#Argument from DepartmentSelectionMenu script
empDepartment=$1

#variables
genderValid=$FALSE
numberValid=$FALSE
ICValid=$FALSE

function isGenderValid() {
    regex="^male$|^female$|^Male$|^Female$"
    local gender="$1"

    if [[ "$gender" =~ $regex ]]; then
        echo $TRUE
    else
        echo $FALSE
    fi

}

function isNumberValid() {
    regex="^[0-9]{3}-[0-9]{8}$"
    local number="$1"

    if [[ "$number" =~ $regex ]]; then
        echo $TRUE
    else
        echo $FALSE
    fi
}

function isICNoValid() {
    regex="^[0-9]{6}-[0-9]{2}-[0-9]{4}$"
    local ic=$1

    if [[ "$ic" =~ $regex ]]; then
        echo $TRUE
    else
        echo $FALSE
    fi
}

loop=y

while [ "$loop" = "y" ]; do
    clear
    echo "Add New Employee Form"
    echo "====================="
    echo

    while [[ $ICValid -eq 1 ]]; do
        echo -n "Employee IC. Number (000000-00-0000) : "
        read empICNo

        ICValid=$(isICNoValid "$empICNo")

        if [[ $ICValid -eq 1 ]]; then
            echo "Invalid IC Number!"
        fi
    done

    echo -n "Employee Name (Xxx Xxx) : "
    read empName

    while [[ $numberValid -eq 1 ]]; do
        echo -n "Contact Number (000-000000) : "
        read empContactNo

        numberValid=$(isNumberValid "$empContactNo")

        if [[ $numberValid -eq 1 ]]; then
            echo "Invalid Contact Number!"

        fi

    done

    echo -n "Email (test@test.com) : "
    read empEmail

    while [[ $genderValid -eq 1 ]]; do
        echo -n "Gender (Male/Female) : "
        read empGender

        genderValid=$(isGenderValid "$empGender")

        if [[ $genderValid -eq 1 ]]; then
            echo "Invalid Gender!"
        fi

    done

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
        echo -n "Press (q) to return to Human Resource Management Menu : "
        read choiceMenu
        case "$choiceMenu" in
        [qQ]) ./HRMenu.sh ;;
        *) echo "Invalid Choice!" ;;
        esac
    fi
done