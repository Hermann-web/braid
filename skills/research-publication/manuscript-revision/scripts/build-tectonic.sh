#!/usr/bin/env bash

set -euo pipefail

if [[ $# -eq 0 || "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  printf 'Usage: %s path/to/main.tex [path/to/other.tex ...]\n' "$0"
  exit 0
fi

if ! command -v tectonic >/dev/null 2>&1; then
  printf 'error: tectonic is not installed or not on PATH\n' >&2
  exit 127
fi

for tex_path in "$@"; do
  if [[ ! -f "$tex_path" ]]; then
    printf 'error: TeX file not found: %s\n' "$tex_path" >&2
    exit 2
  fi

  if [[ "$tex_path" != *.tex ]]; then
    printf 'error: expected a .tex file: %s\n' "$tex_path" >&2
    exit 2
  fi

  tex_dir="$(cd "$(dirname "$tex_path")" && pwd -P)"
  tex_name="$(basename "$tex_path")"

  (
    cd "$tex_dir"
    SOURCE_DATE_EPOCH="${SOURCE_DATE_EPOCH:-0}" \
      tectonic "$tex_name" --outdir "$tex_dir"
  )

  printf 'PDF generated at %s/%s.pdf\n' "$tex_dir" "${tex_name%.tex}"
done
