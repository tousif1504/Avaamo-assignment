Q1. 1. Show list of processes using the network.

Ans: To display a list of processes currently using the network on a typical Unix-based operating system, you can use the `netstat` command. However, please note that the exact command and options may vary depending on your specific operating system and its version. Here's a general command that should work on most Unix-based systems:

    ```shell
    netstat -tulnep
    ```

    This command will show you a list of network connections, along with the corresponding processes and their process IDs (PIDs). The options used in the command have the following meanings:

    - `-t`: Displays TCP connections.
    - `-u`: Displays UDP connections.
    - `-l`: Shows only listening sockets (open ports) on the system.
    - `-n`: Displays numerical IP addresses and port numbers instead of resolving them to hostnames and service names.
    - `-e`: Shows the PID and the name of the process that owns the socket.

    The output will include columns such as "Local Address," "Foreign Address," "State," and "PID/Program name," which will help you identify the processes using the network.

    Please note that on some systems, you might need administrative privileges (e.g., running the command with `sudo`) to see the full information, including the process names.

Q2. Show the list of IPs a process is connected to

Ans: To show the list of IP addresses a specific process is connected to on a Unix-based operating system, you can use the `lsof` (List Open Files) command along with some additional options. Here's a general command structure:

    ```shell
    lsof -p <PID> -a -i
    ```

    Replace `<PID>` with the process ID of the target process. This command will list all network connections associated with the given process. The options used in the command have the following meanings:

    - `-p <PID>`: Specifies the process ID for which you want to list the network connections.
    - `-a`: Performs an AND operation, ensuring that all specified conditions are met.
    - `-i`: Filters the results to show only network connections.

    Here's an example command to list the IP addresses a process with PID 12345 is connected to:

    ```shell
    lsof -p 12345 -a -i
    ```

    The output will include columns such as "COMMAND," "PID," "USER," "FD," "TYPE," "DEVICE," and "SIZE/OFF," along with the IP addresses and port numbers in the "ADDRESS" column. This information will help you identify the specific IP addresses the process is connected to.

    Please note that you might need administrative privileges (e.g., running the command with `sudo`) to see the full information, especially for processes owned by other users.


Q3. Show how to list open files and kill processes tied to a user

Ans: To list open files and kill processes tied to a specific user on a Unix-based operating system, you can use the `lsof` (List Open Files) and `kill` commands in combination. Here's a step-by-step guide:

    1. List Open Files:
    Run the following command to list all open files associated with the user:

    ```shell
    lsof -u <username>
    ```

    Replace `<username>` with the username of the user whose processes and open files you want to inspect. This command will display a list of open files along with the corresponding processes and their process IDs (PIDs).

    2. Identify the PID:
    From the output of the previous command, note down the PIDs of the processes you want to terminate.

    3. Kill Processes:
    To terminate a process, you can use the `kill` command followed by the PID. Run the following command to kill a process:

    ```shell
    kill <PID>
    ```

    Replace `<PID>` with the PID of the process you want to terminate. You may need administrative privileges (e.g., running the command with `sudo`) if you are killing processes owned by other users.

    If a process does not respond to a regular termination signal, you can use the `-9` option with the `kill` command to send a forceful termination signal:

    ```shell
    kill -9 <PID>
    ```

    Again, replace `<PID>` with the PID of the process.
