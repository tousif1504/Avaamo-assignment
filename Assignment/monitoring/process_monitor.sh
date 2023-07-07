#!/bin/bash

# Configuration
PROCESS_NAME="your_process_name"
CPU_THRESHOLD=80
EMAIL_RECIPIENT="recipient@example.com"
EMAIL_SUBJECT="Process Monitoring Alert"

# Function to send an email
send_email() {
  echo "Process '$PROCESS_NAME' state has changed: $1" | mailx -s "$EMAIL_SUBJECT" "$EMAIL_RECIPIENT"
}

# Function to monitor the process
monitor_process() {
  while true; do
    # Check if the process is running
    if pgrep -x "$PROCESS_NAME" >/dev/null; then
      echo "Process '$PROCESS_NAME' is running."
    else
      send_email "Process stopped"
    fi

    # Check CPU usage
    cpu_usage=$(top -bn1 -p "$(pgrep -x "$PROCESS_NAME" | tr '\n' ',')" | tail -n +8 | awk '{sum += $9} END {print sum}')
    cpu_usage=${cpu_usage%.*}  # Remove decimal part
    if [[ $cpu_usage -gt $CPU_THRESHOLD ]]; then
      send_email "High CPU usage: $cpu_usage%"
    fi

    sleep 1m  # Adjust sleep duration as per your needs
  done
}

# Start monitoring the process
monitor_process