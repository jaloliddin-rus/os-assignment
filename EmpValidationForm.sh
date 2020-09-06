#!/bin/bash
#Author: Jaloliddin

empDB="Employee.txt"

#constants
declare -r TRUE=0
declare -r FALSE=1

#text color
RED='\033[0;31m' #red
NC='\033[0m' # default
GREEN='\033[0;32m' #green

#variables & declarations
startDateValid=$FALSE
endDateValid=$FALSE
dateComparisonValid=$FALSE

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

dateComparison() {
	local startDate="$1"
	local endDate="$2"

	date "+%m-%Y" -d "$startDate" >/dev/null 2>&1
	date "+%m-%Y" -d "$endDate" >/dev/null 2>&1

	if [[ $startDate > $endDate ]]; then
		echo $FALSE
	else
		echo $TRUE
	fi
}

clear

printf "%-30sEmployee Validation Form\n"
printf "%-30s-------------------------\n"

while [[ $startDateValid -eq 1 || $endDateValid -eq 1 || $dateComparisonValid -eq 1 ]]; do
	echo "Please enter the Review Period (From mm-yyyy To mm-yyyy)"

	printf 'From: '
	read startDate

	printf 'To: '
	read endDate

	startDateValid=$(isValidDate "$startDate")
	endDateValid=$(isValidDate "$endDate")
	dateComparisonValid=$(dateComparison "$startDate" "$endDate")

	if [[ $startDateValid -eq 1 || $endDateValid -eq 1 ]]; then
		printf "${RED}Invalid Date!${NC}\n"
	fi

	if [[ $dateComparisonValid -eq 1 ]]; then
		printf "${RED}Invalid Date Range!${NC}\n"
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

printf "Press ${GREEN}(n)${NC} to continue to the Employee Performance Review Form or \n${RED}(q)${NC} to quit from the prompt and return to Human Resources Management Menu: "
read choice
case $choice in
n) ./EmpPerfReviewForm.sh "$ICNo" "$name" "$startDate" "$endDate" ;;
q) ./HRMenu.sh ;;
*) echo -n "Invalid Choice!" ;;
esac
