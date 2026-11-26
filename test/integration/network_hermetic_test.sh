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

unshare -rn -- "$bin" --json