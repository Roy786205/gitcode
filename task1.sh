#!/bin/bash

# Prompt user for directory to save the log file
echo "Enter the directory where you want to save the TRACE log:"
read directory

# Create the directory if it doesn't exist
if [ ! -d "$directory" ]; then
  mkdir -p "$directory"
  echo "Directory $directory created."
fi

# Define the filename with the current date
current_date=$(date +%Y-%m-%d)
filename="TRACE.log.$current_date.txt"

# Fetch the log file using curl and filter TRACE entries
curl -s "https://www.ibm.com/docs/en/zos/2.4.0?topic=problems-example-log-file" \
| grep "TRACE" > "$directory/$filename"

# Check if the file was created and display the result
if [ -s "$directory/$filename" ]; then
  echo "TRACE entries have been saved to $directory/$filename"
else
  echo "No TRACE entries found in the log file."
fi
