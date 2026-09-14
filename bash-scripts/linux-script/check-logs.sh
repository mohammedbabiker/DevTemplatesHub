#!/bin/bash

# What if we able to insert the $(pwd) in a promt diretly
LOG_DIR="/location/to/logs/folder"

ERROR_PATTERNS=("ERROR" "FATAL" "CRITICAL")

echo "=================="
echo "analysig log files"
echo "=================="

echo -e "\nList of log files updated in last 24 hours"
LOG_FILES=$(find $LOG_DIR -name "*.log" -mtime -1)
echo "$LOG_FILES"

for LOG_FILE in $LOG_FILES; do

  echo -e "\n"
  echo "=================================================="
  echo "===================$LOG_FILE======================"
  echo "=================================================="
  

  for PATTERN in ${ERROR_PATTERNS[@]}; do

    echo -e "\nSearching $PATTERN logs in $LOG_FILE file"
    grep "$PATTERN" "$LOG_FILE"

    echo -e "\nNumber of  $PATTERN logs found in $LOG_FILE"
    grep -c "$PATTERN" "$LOG_FILEl"

    #if [ "$ERROR_COUNT" -gt ]
    
  done
done

