#!/bin/bash
#./file_permissions.sh

#file
loginDB="login.txt"

echo "Welcome to the HR Management Login Screen!"
echo
echo -n "Email (test@test.com) : "
read lemail
echo -n "Password (          ) : "
read lpassword

if [ -n "$lemail" ] && [ -n "lpassword" ]; then
	while IFS=: read -r email password department position; do
		if [[ $lemail == $email ]]; then
			if [[ $lpassword == $password ]]; then
				echo "Successful Login"
			fi
		else
			echo "Wrong email or password!"
		fi
	done <$loginDB
else
	echo "Incomplete Input!"
fi
