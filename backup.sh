#!/bin/bash

# Checks if the number of arguments is correct
# If the number of arguments is incorrect (not equal to 2), print an error message and exit
if [[ $# != 2 ]]
then
    echo "Usage: backup.sh target_directory_name destination_directory_name"
    exit 1
fi

# Checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
    echo "Invalid directory path provided"
    exit 1
fi

# # This checks if argument 1 and argument 2 are valid directory paths
# if [[ ! -d $1 ]] || [[ ! -d $2 ]]
# then
#   echo "Invalid directory path provided"
#   exit
# fi

# [TASK 1] Assigning provided arguments to variables
targetDirectory=$1
destinationDirectory=$2
# [TASK 2] Displaying the values of the two command line arguments
echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

# [TASK 3] Defining a variable for the current timestamp
currentTS=$(date +%s)

# [TASK 4] Defining a variable for the backup file name
backupFileName="backup-${currentTS}.tar.gz"

# [TASK 5] Defining a variable with the absolute path of the current directory
origAbsPath=$(pwd)

# [TASK 6] Changing to the destination directory and capturing its absolute path
cd "$destinationDirectory"
destDirAbsPath=$(pwd)
cd "$origAbsPath"  # Return to the original directory

# [TASK 7] Changing directories to the target directory
cd "$targetDirectory"

# [TASK 8] Define a variable for the timestamp 24 hours ago
yesterdayTS=$(($currentTS - 24 * 60 * 60))
# yesterdayTS=$(($currentTS - 86400))  # 86400 seconds in a day

# Preparing an array to hold the names of files to back up
declare -a toBackup

# [TASK 9] Looping through all files and directories in the current folder
for file in $(ls); do  # Capture all files and directories in the current directory
    # [TASK 10] Check if each file was modified within the last 24 hours
    file_last_modified_date=$(date -r "$file" +%s)  # Last modified date in seconds
    if [[ $file_last_modified_date -gt $yesterdayTS ]]; then
        # [TASK 11] Add the file to the toBackup array if it was updated within the last 24 hours
        toBackup+=("$file")
    fi
done

# Returning to the original directory before creating the backup
cd "$origAbsPath"

# [TASK 12] Compress and archive the files if there are any to back up
if [ ${#toBackup[@]} -gt 0 ]; then
    # Create the archive in the target directory and then move it
    tar -czf "$backupFileName" -C "$targetDirectory" "${toBackup[@]}"
    # [TASK 13] Move the backup file to the destination directory
    mv "$backupFileName" "$destDirAbsPath"
    echo "Backup of updated files completed successfully."
else
    echo "No files were updated in the last 24 hours."
fi

echo "Backup process completed."

# Congratulations! You completed the final project for this course!
