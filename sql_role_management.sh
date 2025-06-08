Instructions:
Task: Create a Shell Script for Role Management
Write a shell script file named role_management_script.sh
User Verification and Creation: Checks if the user "Alice" exists in the database. If not, it creates this user with a predefined password.
Role Verification and Creation: Checks if the role "data_entry" exists. If not, the script creates this role.
Role Assignment: Assigns the "data_entry" role to "Alice" and refreshes database privileges to ensure the changes take effect immediately.
You need to use some predefined values inside you script:

Username:
"Alice"
Role Name:
"data_entry"
MySQL Credentials:
Username (MYSQL_USER):
"root"
Password (MYSQL_PASSWORD):
"user@123!"
Host (MYSQL_HOST):
"localhost"
To execute this script, please run: sudo chmod +x rolemanagementscript.sh followed by ./rolemanagementscript.sh.