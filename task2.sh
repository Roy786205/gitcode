#!/bin/bash

echo "Enter the directory where you want to save the TRACE log:"
read directory

if [ ! -d "$directory" ]; then
  mkdir -p "$directory"
  echo "Directory $directory created."
fi

current_date=$(date +%Y-%m-%d)
filename="TRACE.log.$current_date.txt"

curl -s "https://example.com/logfile" | grep "TRACE" > "$directory/$filename"

if [ -s "$directory/$filename" ]; then
  echo "TRACE entries have been saved to $directory/$filename"
else
  echo "No TRACE entries found in the log file."
fi


