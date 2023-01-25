#!/bin/bash

# We will access the remote server and the mongodb data in the folder on your desktop
# Then, Zip the backup folder
# Copy the backup zip folder to our local host
# Clear all the files form Remote_Server

# Make sure to Install sshpass
# Give Permissions to your shell script file using
# $ chmod +x Script-Name.sh

# Change Remote_Server Credientials, Database_Name and path for the files

remote_server=username@ip
remote_password=password
remote_db=database_name

# Connect to remote server and create a backup of the MongoDB database
sshpass -p $remote_password ssh $remote_server "mongodump --db $remote_db --out /home/mohasin/Desktop/mongobackups"

#zip the folder
sshpass -p $remote_password ssh $remote_server "zip -r /home/mohasin/Desktop/mongobackups/Employees /home/mohasin/Desktop/mongobackups/Employees"
# Download the backup file from the remote server to the local machine
sshpass -p $remote_password scp $remote_server:/home/mohasin/Desktop/mongobackups/Employees.zip .


#cleanup the remote dump and compressed files
sshpass -p $remote_password ssh $remote_server "rm -r cd /home/mohasin/Desktop/mongobackups *"

