# Nginx Log Analyser

This script analyzes nginx access logs to provide insights into web server traffic patterns.

## Features

- Top 5 IP addresses by request count
- Top 5 most requested paths
- Top 5 HTTP status codes
- Top 5 user agents

## Usage

Place your nginx access log file as `nginx-access.log` in the same directory as the script, then run:

```bash
./log-analyser.sh
```

## Requirements

- awk command
- grep command
- nginx access log in standard format

## Log Format Expected

The script expects nginx access logs in the standard combined format:
```
IP - - [timestamp] "METHOD path HTTP/version" status bytes "referer" "user-agent"
```

## Output

The script displays four sections:
1. **Top 5 IP addresses** - Most active client IPs
2. **Top 5 requested paths** - Most popular URLs
3. **Top 5 status codes** - HTTP response code distribution
4. **Top 5 user agents** - Most common browser/client identifiers