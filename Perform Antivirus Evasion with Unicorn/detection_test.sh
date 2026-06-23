#!/bin/bash

echo "=== Antivirus Detection Analysis ==="
echo "Date: $(date)"
echo "===================================="

TOTAL=0
DETECTED=0

for payload in payload_*.txt; do
    if [ -f "$payload" ]; then
        TOTAL=$((TOTAL + 1))
        echo -n "Testing $payload: "
        
        if clamscan --no-summary "$payload" 2>/dev/null | grep -q "FOUND"; then
            echo "DETECTED"
            DETECTED=$((DETECTED + 1))
        else
            echo "NOT DETECTED"
        fi
    fi
done

EVASION_RATE=$(( (TOTAL - DETECTED) * 100 / TOTAL ))

echo "===================================="
echo "Total Payloads: $TOTAL"
echo "Detected: $DETECTED"
echo "Evaded: $((TOTAL - DETECTED))"
echo "Evasion Rate: ${EVASION_RATE}%"
