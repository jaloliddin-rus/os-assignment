#!/bin/bash
#author: Jaloliddin
echo "Login Screen"
echo "=========================="
echo "Email: "
read lemail
echo "Password: "
read -s lpassword
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