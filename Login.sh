#AUTHOR: HARRSIMRAN KAUR & JALOLIDDIN RUSTAMOV

#!/bin/bash
. ./file_permission.sh

#variable
INPUT="login.txt"
declare -r TRUE=0
declare -r FALSE=1
emailValidation=$FALSE
passwordValidation=$FALSE
isSuccess=$FALSE
RED='\033[0;31m' #red color text
NC='\033[0m'     # default color

#validation functions
function isEmailValid() {
	regex="^([A-Za-z]+[A-Za-z0-9]*\+?((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*)*)@(([A-Za-z0-9]+)+((\.|\-|\_)?([A-Za-z0-9]+)+)*)+\.([A-Za-z]{2,})+$"
	email=$1

	if [[ $email =~ $regex ]]; then
		echo $TRUE
	else
		echo $FALSE
	fi
}

function passwordLengthCheck() {
	password=$1
	length=${#password}

	if [[ $length -gt 8 || $length -lt 0 ]]; then
		echo $FALSE
	else
		echo $TRUE
	fi
}

#checks if file exists
[ ! -f $INPUT ] && {
	echo "$INPUT file not found"
	exit 99
}

clear

echo "Welcome to the HR Management Login Screen!"
echo "------------------------------------------"

while [[ $isSuccess -eq $FALSE ]]; do
	while [[ $emailValidation -eq 1 || $passwordValidation -eq 1 ]]; do
		printf "Email: "
		read lemail
		emailValidation=$(isEmailValid "$lemail")

		printf "Password: "
		read -s lpassword
		passwordValidation=$(passwordLengthCheck "$lpassword")

		if [[ $emailValidation -eq 1 ]]; then
			printf "${RED}\nInvalid Email Format!${NC}\n"
		fi

		if [[ $passwordValidation -eq 1 ]]; then
			printf "${RED}\nPassword must be 8 characters or shorter!${NC}\n"
		fi
	done

	IFS='|'
	while read -r email password dept pos; do
		if [[ "$lemail" == "$email" ]]; then
			if [[ "$lpassword" == "$password" ]]; then
				isSuccess=$TRUE
			fi
		fi
	done <"$INPUT"

	if [[ $isSuccess -eq $TRUE ]]; then
		./HRMenu.sh
	else
		emailValidation=$FALSE
		passwordValidation=$FALSE
		printf "\n${RED}Login Failed!${NC}\n"
	fi
done
