#!/bin/bash
#Author: Jaloliddin

empDB="Employee.txt"

#constants
declare -r TRUE=0
declare -r FALSE=1

isValidDate() {
	local date="$1"
	date "+%m-%Y" -d "$date" >/dev/null 2>&1
	if [ $? != 0 ]; then
		#1 = false
		echo $FALSE
	else
		#0 = true
		echo $TRUE
	fi
}

clear

echo "Employee Validation Form"
echo "------------------------"
test1=$FALSE
test2=$FALSE
while [[ $test1 -eq 1 || $test2 -eq 1 ]]; do
	echo -n "Please enter the Review Period (From mm-yyyy To mm-yyyy): "
	read startDate
	test1=$(isValidDate "$startDate")
	read endDate
	test2=$(isValidDate "$endDate")

	if [[ $test1 -eq 1 || $test2 -eq 1 ]]; then
		echo "Invalid Date!"
	fi
done

echo -n "Plese enter the Employee's IC. Number (xxxxxx-xx-xxxx): "
read ICNo

while IFS=: read -r empDept empICNo empName empPhone empEmail empGender empBirthDate empJobTitle empJoinDate; do
	if [[ $empICNo == $ICNo ]]; then
		name=$empName
		echo "Employee Name: $empName"
		echo "Job Title: $empJobTitle"
		echo "Department: $empDept"
	fi
done <$empDB

echo -n "Press (n) to continue to the Employee Performance Review Form or (q) to quit from the prompt and return to Human Resources Management Menu: "
read choice
case $choice in
n) ./EmpPerfReviewForm.sh "$ICNo" "$name" "$startDate" "$endDate" ;;
q) ./HRMenu.sh ;;
*) echo -n "Invalid Choice!" ;;
esac
