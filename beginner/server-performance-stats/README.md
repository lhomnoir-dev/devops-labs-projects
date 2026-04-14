# Server Performance Stats

This script provides a comprehensive overview of server performance metrics including CPU, memory, disk usage, and process information.

## Features

- CPU usage percentage
- Memory usage (free, used, percentage)
- Disk usage for root filesystem
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

## Usage

```bash
./server-stats.sh
```

## Requirements

- Standard Unix tools: top, free, df, ps, awk
- Root or appropriate permissions for system monitoring

## Output Sections

1. **CPU Usage** - Total CPU utilization percentage
2. **Memory Usage** - Free and used memory with percentage
3. **Disk Usage** - Free and used disk space with percentage for /
4. **Top 5 CPU Processes** - User, PID, CPU%, Command
5. **Top 5 Memory Processes** - User, PID, Memory%, Command

## Notes

- CPU and memory percentages are system-wide
- Disk usage is for the root filesystem only
- Process lists show the top 5 consumers (excluding headers)