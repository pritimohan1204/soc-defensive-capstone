#!/bin/bash

# Create a timestamped report filename
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
REPORT="soc_report_$TIMESTAMP.txt"

# Ask the user for a log file path
read -r -p "Enter the log file path: " LOGFILE

# Check whether the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: Log file not found."
    exit 1
fi

# Collect system information and analyze logs
{
    echo "********************************"
    echo "      SOC DEFENSIVE REPORT      "
    echo "********************************"

    # Display system information
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo "Current User: $(whoami)"

    # Display uptime, memory, and disk usage
    echo "UPTIME"
    uptime

    echo "MEMORY USAGE"
    free -h

    echo "DISK USAGE"
    df -h

    # Count total log lines
    echo "LOG INFORMATION"
    echo "Log File: $LOGFILE"
    echo "Total Log Lines: $(wc -l < "$LOGFILE")"

    # Search for security-related keywords
    echo "SECURITY EVENTS"
    grep -Ei "failed|denied|error|warning" "$LOGFILE" || true

    # Display the last 10 log entries
    echo "LAST 10 LOG LINES"
    tail -n 10 "$LOGFILE"

# Display output and save it to the report file
} | tee "$REPORT"

# Display the report location
echo "Report saved to: $REPORT"
