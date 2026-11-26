# vpsinspect

Read-only Linux VPS security inspection and scoring (Go, `CGO_ENABLED=0` static binaries).

- **Module path:** `github.com/vpsinspect/vpsinspect`
- **License:** MIT
- **Status:** Phase 0 — stub CLI (`--version`, `--json`); audit engine lands in v0.1 per [master spec](https://github.com/vpsinspect/.github/blob/main/NAMESPACES.md).

## Build (local)

```bash
make vendor build
./vpsinspect --version
```

## Verify a release (after `v0.0.1+`)

```bash
gh attestation verify dist/vpsinspect_* -R vpsinspect/vpsinspect
sha256sum -c SHA256SUMS.txt
```