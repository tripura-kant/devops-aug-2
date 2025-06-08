#Instructions:
#Task: Create a Shell Script for Role Management
#Write a shell script file named role_management_script.sh
#User Verification and Creation: Checks if the user "Alice" exists in the database. If not, it creates this user with a predefined password.
#Role Verification and Creation: Checks if the role "data_entry" exists. If not, the script creates this role.
#Role Assignment: Assigns the "data_entry" role to "Alice" and refreshes database privileges to ensure the changes take effect immediately.
#You need to use some predefined values inside you script:
#
#Username:
#"Alice"
#Role Name:
#"data_entry"
#MySQL Credentials:
#Username (MYSQL_USER):
#"root"
#Password (MYSQL_PASSWORD):
#"user@123!"
#Host (MYSQL_HOST):
#"localhost"
#To execute this script, please run: sudo chmod +x rolemanagementscript.sh followed by ./rolemanagementscript.sh.

MYSQL_USER="root"
MYSQL_PASSWORD="user@123!"
MYSQL_HOST="localhost"

# Target user and role
TARGET_USER="Alice"
TARGET_PASSWORD="Alice@123!"
TARGET_ROLE="data_entry"

USER_EXISTS=$(mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$TARGET_USER');")

# Create user if not exists
if [ "$USER_EXISTS" -eq 0 ]; then
  echo "Creating user '$TARGET_USER'..."
  mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -e "CREATE USER '$TARGET_USER'@'%' IDENTIFIED BY '$TARGET_PASSWORD';"
else
  echo "User '$TARGET_USER' already exists."
fi

# Check if role exists
ROLE_EXISTS=$(mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$TARGET_ROLE' AND is_role = 'Y');")

# Create role if not exists
if [ "$ROLE_EXISTS" -eq 0 ]; then
  echo "Creating role '$TARGET_ROLE'..."
  mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -e "CREATE ROLE '$TARGET_ROLE';"
else
  echo "Role '$TARGET_ROLE' already exists."
fi

# Grant role to user
echo "Granting role '$TARGET_ROLE' to user '$TARGET_USER'..."
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -e "GRANT '$TARGET_ROLE' TO '$TARGET_USER';"

# Apply changes
echo "Flushing privileges..."
mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" -e "FLUSH PRIVILEGES;"

echo "Role management completed."


