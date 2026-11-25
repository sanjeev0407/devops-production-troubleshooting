#!/usr/bin/env bash
# READ-ONLY collector for authorized hosts. Output may contain sensitive data.
set -u
OUT="${1:-incident-evidence-$(date -u +%Y%m%dT%H%M%SZ).txt}"
{
 echo "=== UTC ==="; date -u
 echo "=== HOST ==="; hostname; uname -a
 echo "=== LOAD ==="; uptime
 echo "=== MEMORY ==="; free -h 2>/dev/null || true
 echo "=== FILESYSTEM ==="; df -h; df -i
 echo "=== TOP CPU ==="; ps aux --sort=-%cpu 2>/dev/null | head -n 15 || ps aux | head -n 15
 echo "=== FAILED SERVICES ==="; systemctl --failed --no-pager 2>&1 || true
 echo "=== SOCKETS ==="; ss -lntup 2>&1 | head -n 100 || true
 echo "=== JOURNAL ==="; journalctl --since '30 minutes ago' --no-pager 2>&1 | tail -n 200 || true
} > "$OUT"
chmod 600 "$OUT"
echo "Saved $OUT. Redact sensitive details before sharing."
