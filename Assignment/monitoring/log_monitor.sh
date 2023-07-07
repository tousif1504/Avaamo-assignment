#!/bin/bash

# Configuration
LOG_FILE="/path/to/logfile.log"
PATTERN="ERROR"
EMAIL_RECIPIENT="recipient@example.com"
EMAIL_SUBJECT="Pattern detected in log file"

# Function to send an email
send_email() {
  echo "Pattern '$PATTERN' detected in log file '$LOG_FILE'." | mailx -s "$EMAIL_SUBJECT" "$EMAIL_RECIPIENT"
}

# Function to monitor the log file
monitor_log() {
  tail -n0 -F "$LOG_FILE" | while read -r line; do
    if echo "$line" | grep -q "$PATTERN"; then
      send_email
    fi
  done
}

# Start monitoring the log file
monitor_log