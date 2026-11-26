#!/usr/bin/env bash
# Phase 0 gate: vpsinspect must run in an isolated network namespace (no outbound sockets).
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
bin="${VPSINSPECT_BIN:-$root/vpsinspect}"
if [[ ! -x "$bin" ]]; then
  echo "skip: binary not found at $bin (set VPSINSPECT_BIN)" >&2
  exit 0
fi

if ! command -v unshare >/dev/null 2>&1; then
  echo "skip: unshare not available" >&2
  exit 0
fi

if unshare -rn -- "$bin" --json 2>/dev/null; then
  exit 0
fi

if command -v sudo >/dev/null 2>&1 && sudo -n true 2>/dev/null; then
  exec sudo -n unshare -n -- "$bin" --json
fi

echo "error: unable to create isolated network namespace" >&2
exit 1
