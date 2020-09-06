#!/bin/bash
#Author: Jaloliddin

empDB="Employee.txt"

#constants
declare -r TRUE=0
declare -r FALSE=1
RED='\033[0;31m'
NC='\033[0m' # No Color

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

printf "%-30sEmployee Validation Form\n"
printf "%-30s-------------------------\n"
startDateValid=$FALSE
endDateValid=$FALSE
while [[ $startDateValid -eq 1 || $endDateValid -eq 1 ]]; do
	echo "Please enter the Review Period (From mm-yyyy To mm-yyyy)"
	printf 'From: '
	read startDate
	startDateValid=$(isValidDate "$startDate")
	printf 'To: '
	read endDate
	endDateValid=$(isValidDate "$endDate")

	if [[ $startDateValid -eq 1 || $endDateValid -eq 1 ]]; then
		printf "${RED}Invalid Date!${NC}\n"
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
