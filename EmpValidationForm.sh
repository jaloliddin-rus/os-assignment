#!/bin/bash
#Author: Jaloliddin
echo "Employee Validation Form"
echo "------------------------"
echo -n "Please enter the Review Period (From mm-yyyy To mm-yyyy): "
read startDate
read endDate
echo -n "Plese enter the Employee's IC. Number (xxxxxx-xx-xxxx): "
read ICNo
empDB="Employee.txt"

while IFS=: read -r empDept empICNo empName empPhone empEmail empGender empBirthDate empJobTitle empJoinDate; do
	if [[ $empICNo == $ICNo ]]; then
		echo "Employee Name: $empName"
		echo "Job Title: $empJobTitle"
		echo "Department: $empDept"
	fi
done <$empDB

echo -n "Press (n) to continue to the Employee Performance Review Form or (q) to quit from the prompt and return to Human Resources Management Menu: "
read choice
case $choice in
	n) ./EmpPerfReviewForm.sh ;;
	q) ./HRMenu.sh ;;
	*) echo -n "Invalid Choice!" ;;
esac
