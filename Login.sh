#!/bin/bash
echo "Employee Validation Form"
echo "------------------------------"
echo "Email: "
read email
echo "Password: "
read -s password
INPUT="login.txt"
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read -r email password dept pos
do
if [[ $lemail = $email ]]
	then
		if [[ $lpassword = $password ]]
			then
				echo "login successful"
				echo "$email works in $dept and he or she is a $pos"
				break
			else
				echo "login failed"
		fi
fi
done < $INPUT
echo "user does not exist"
IFS=$OLDIFS


