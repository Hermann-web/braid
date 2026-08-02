---
name: notebook-workflow
description: Use when reading, editing, syncing, or validating Jupyter notebooks, especially when a repository pairs Jupytext `.py` sources with `.ipynb` files. Do not use for ordinary Python modules or data files that are not notebooks.
---

# Notebook Workflow

Use this skill for tasks such as:

- inspecting notebook structure or cell contents
- editing notebooks safely without hand-editing raw `.ipynb` JSON
- syncing a paired `.py` notebook source back to `.ipynb`
- validating notebook logic in environments where Jupyter execution may be restricted

## Preferred Workflow

1. Find the canonical source.
If a paired Jupytext `.py` notebook exists, treat that as the main editable source.
If only an `.ipynb` exists, inspect it first and consider creating a paired `.py` source when notebook work will continue across multiple edits.

2. Read cheaply first.
Use shell inspection for fast context:

```bash
sed -n '1,240p' notebooks/example.py
python -m jupyter nbconvert --to script --stdout notebooks/example.ipynb \
  | sed -n '1,240p'
```

Use the repository's existing Python environment and command runner. The
commands below show `uv` for a `uv`-managed repository; use the equivalent
project command when the repository uses another runner.

3. Edit the text source, not raw notebook JSON.
Prefer patching the paired `.py` file with `apply_patch`.
Factor repeated logic into helper modules when notebook cells start duplicating preprocessing, plotting, or evaluation code.

4. Sync back to `.ipynb`.
When using Jupytext, regenerate the notebook from the text source:

```bash
uv run jupytext --to ipynb notebooks/example.py -o notebooks/example.ipynb
```

5. Validate with the least fragile execution path.
If direct Jupyter execution works, use it.
If the environment blocks Jupyter kernel sockets, run the paired `.py` source directly instead.

Preferred validation order:

```bash
uv run jupyter nbconvert --execute --to notebook --inplace \
  --ExecutePreprocessor.timeout=600 notebooks/example.ipynb
```

Fallback for restricted environments:

```bash
MPLBACKEND=Agg uv run python notebooks/example.py
```

## Practical Rules

- Treat `.ipynb` as a synced artifact when a paired `.py` file exists.
- Use `MPLBACKEND=Agg` for notebook validation in non-interactive environments.
- Expect Jupyter execution to fail in sandboxes that block local socket creation.
- Keep notebook markdown focused on findings and decisions; move reusable mechanics into Python modules.
- After model or data-workflow changes, rerun the paired `.py` source to catch ordering bugs and stale imports.

## Output Expectations

When notebook work is complete:

- the paired `.py` source should be the most readable, maintainable version
- the `.ipynb` should be resynced from that source
- validation should be reported explicitly: Jupyter executed, or `.py` source executed as fallback
