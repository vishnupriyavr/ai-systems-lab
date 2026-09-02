#!/usr/bin/env bash
set -euo pipefail

status=0

if rg --hidden --glob '!.git/**' --glob '!scripts/check-public.sh' \
  '(BEGIN (RSA|OPENSSH|EC|DSA) PRIVATE KEY|AKIA[0-9A-Z]{16}|password\s*[:=]\s*\S+)' .; then
  echo "Potential secret-like content found. Review before publishing."
  status=1
fi

if find . -path './.git' -prune -o -type f \( -name '*.pem' -o -name '*.key' -o -name '.env' \) -print | grep -q .; then
  echo "Sensitive filename found. Review before publishing."
  status=1
fi

if git diff --check; then
  :
else
  status=1
fi

exit "$status"
