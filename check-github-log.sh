#!/bin/bash
echo "=== Latest GitHub Issues Check ==="
if [ -f "/home/blake/github-log.txt" ]; then
    tail -20 /home/blake/github-log.txt
    echo ""
    echo "=== Full log available at: /home/blake/github-log.txt ==="
else
    echo "No GitHub log file found yet. Check will run daily at 9 AM."
fi