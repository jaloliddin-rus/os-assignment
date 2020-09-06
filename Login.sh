#!/bin/bash
. ./file_permission.sh
clear
echo "Employee Validation Form"
echo "------------------------------"
echo -n "Email: "
read lemail
echo -n "Password: "
read -s lpassword
INPUT="login.txt"
[ ! -f $INPUT ] && {
	echo "$INPUT file not found"
	exit 99
}
while IFS=, read -r email password dept pos; do
	if [[ $lemail = $email && $lpassword = $password ]]; then
		echo "Login Successful"
		read -n 1 -s -r -p "Press any key to continue"
		./HRMenu.sh
		break
	else
		echo "Login Failed"
		read -n 1 -s -r -p "Press any key to continue"
		./Login.sh
		break
	fi
done <$INPUT
