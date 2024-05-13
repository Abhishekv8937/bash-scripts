#!/bin/bash/
read -p "Enter Your Name : " NAME
PASSWD=$(openssl rand -base64 12)

read -p "Enter your password or press enter to continue with the autogenerated one : " password
if [ -z $password ]
then
	password=$PASSWD
fi
sudo useradd -m -s /bin/bash "$NAME"
echo "$NAME:$password" | sudo chpasswd
echo "Your password is : $password"
sudo chage -d 0 $NAME

read -p "Do you want to delete the user you just created now ? (yes/no): " delete_user_info

if [ "$delete_user_info" = "yes" ]; then
    # Redirect user information to a new file before deleting
    sudo cat /etc/passwd | grep "$username" > "$username"_info.txt

    # Delete the user
    sudo userdel -r "$username"
    echo "User $username deleted successfully."
fi

echo "User $username created successfully."

