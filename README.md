# Scenario
Imagine that you are a lead Linux developer at the top-tech company ABC International Inc. ABC currently suffers from a huge bottleneck: each day, interns must painstakingly access encrypted password files on core servers and back up any files that were updated within the last 24 hours. This process introduces human error, lowers security, and takes an unreasonable amount of work.

As one of ABC Inc.'s most trusted Linux developers, you have been tasked with creating a script called backup.sh which runs every day and automatically backs up any encrypted password files that have been updated in the past 24 hours.

# Learning Objectives
By completing this final project, you will:

Demonstrate your advanced shell scripting skills in a real-world scenario
Apply the knowledge you've gained to reviewing and grading technical work submtted by your peers

# Instructions
In this scenario, you are a lead Linux developer at the top-tech company ABC International Inc. As one of ABC Inc.'s most trusted Linux developers, you have been tasked with creating a script called backup.sh which runs every day and automatically backs up any encrypted password files that have been updated in the past 24 hours.

*Introductions on how to run the project locally
- Save the backup.sh file you're working on and make it executable using: 
*chmod u+x
- Verify the file is executable using the ls command with the -l option using:
**ls -l backup.sh
- Download the following .zip file with the wget command:
# wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-LX0117EN-SkillsNetwork/labs/Final%20Project/important-documents.zip
- Update the file’s last-modified date to now:
# touch important-documents/*
- Test your script using the following command:
# ./backup.sh important-documents .
- Copy the backup.sh script into the /usr/local/bin/ directory and make it excuatable. (Do not use mv.)
# Note: You may need to use sudo cp in order to create a file in /usr/local/bin/.
- Test the cronjob to see if the backup script is getting triggered by scheduling it for every 1 minute.
# crontab -e on linux and mac especially for those using nano
# */1 * * * * /usr/local/bin/backup.sh /home/project/important-documents /home/project
- Please note that since the Theia Lab is a virtual environment, we need to explicitly start the cron service using the below command:
# sudo service cron start
- Once the cron service is started, check in the directory /home/project to see if the .tar files are being created.
- If they are, then stop the cron service using the below command, otherwise it will continue to create .tar files every minute:
# sudo service cron stop
- Using crontab, schedule your /usr/local/bin/backup.sh script to backup the important-documents folder every 24 hours to the directory /home/project.
# Happy Coding 
