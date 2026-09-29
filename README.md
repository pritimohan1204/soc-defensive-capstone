# SOC Defensive Capstone

A Bash-based SOC project for Linux system monitoring and security log analysis.

## Features

* Collects system information, uptime, memory, and disk usage.
* Checks whether the log file exists.
* Counts total log lines.
* Searches for failed, denied, error, and warning events.
* Displays the last 10 log entries.
* Saves results in a timestamped report.

## Tools Used

* Kali Linux
* Bash scripting
* Linux command-line tools

## How to Run

```bash
chmod +x soc-triage.sh
./soc-triage.sh
```

Enter a log file path when prompted.

Example:

```text
/var/log/auth.log
```

## Disclaimer

This project performs basic keyword-based log triage for educational purposes. Keyword matches do not confirm an attack.

## Author

Pritimohan Sahu

Cybersecurity Student | Aspiring SOC Analyst 
## Project Execution

Screenshot of the SOC Defensive Capstone running in Kali Linux:

![SOC Script Execution](soc-triage-output.png)
