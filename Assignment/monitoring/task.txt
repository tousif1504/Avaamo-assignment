Q1. write a script to Monitor a log file, detect a pattern detection, send an email on detection

Ans: Here's an example of a shell script that monitors a log file, detects a specified pattern, and sends an email when the pattern is detected. This script uses `grep` to search for the pattern in the log file and `mailx` to send the email.

```bash
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
```

Here's how the script works:

1. Set the `LOG_FILE` variable to the path of the log file you want to monitor.
2. Set the `PATTERN` variable to the pattern you want to detect in the log file (e.g., "ERROR").
3. Set the `EMAIL_RECIPIENT` variable to the email address where you want to receive notifications.
4. Set the `EMAIL_SUBJECT` variable to the subject of the email notification.
5. The `send_email` function sends an email using the `mailx` command with the provided subject and message.
6. The `monitor_log` function uses `tail` to continuously monitor the log file (`-F` option) and read new lines as they are appended.
7. For each line read, it checks if the line contains the specified pattern using `grep`. If a match is found, it calls the `send_email` function to send the notification email.
8. Finally, the script starts monitoring the log file by calling the `monitor_log` function.

Make sure to replace the placeholder values with your actual configurations, and ensure that you have the `mailx` command installed and properly configured on your system to send emails.

Save the script to a file (e.g., `log_monitor.sh`), make it executable using `chmod +x log_monitor.sh`, and then run it in the terminal using `./log_monitor.sh`. The script will continuously monitor the log file, and when the specified pattern is detected, it will send an email to the provided recipient.


Q2. Write a script to monitor process particular process on an instance, send an email on incase of state change like process got stopped, taking more CPU that threshold

Ans: Here's an example of a shell script that monitors a particular process on a system, detects state changes such as the process being stopped or consuming more CPU than a threshold, and sends an email notification.

```bash
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
```

Here's how the script works:

1. Set the `PROCESS_NAME` variable to the name of the process you want to monitor (e.g., "your_process_name").
2. Set the `CPU_THRESHOLD` variable to the CPU usage threshold in percentage (e.g., 80).
3. Set the `EMAIL_RECIPIENT` variable to the email address where you want to receive notifications.
4. Set the `EMAIL_SUBJECT` variable to the subject of the email notification.
5. The `send_email` function sends an email using the `mailx` command with the provided subject and message.
6. The `monitor_process` function runs an infinite loop to continuously monitor the process.
7. Inside the loop, it checks if the process is running using `pgrep`. If the process is not found, it calls the `send_email` function with the message "Process stopped".
8. It also retrieves the CPU usage of the process using `top` and calculates the total CPU usage percentage. If the usage exceeds the threshold, it calls the `send_email` function with the message "High CPU usage: <cpu_usage>%".
9. The loop sleeps for a duration (1 minute in the example) before checking again. Adjust the sleep duration as per your needs.

Make sure to replace the placeholder values with your actual configurations, and ensure that you have the `mailx` command installed and properly configured on your system to send emails.

Save the script to a file (e.g., `process_monitor.sh`), make it executable using `chmod +x process_monitor.sh`, and then run it in the terminal using `./process_monitor.sh`. The script will continuously monitor the specified process and send email notifications when state changes are detected.
