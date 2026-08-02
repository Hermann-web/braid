# Contributing

Contributions should make one recurring agent workflow more reliable without
binding it to one workstation or repository.

## Decide whether a skill belongs here

A reusable skill describes a workflow that remains useful across unrelated
repositories. A skill that depends on one named repository, fixed internal
file, private project structure, organization-specific process, or unpublished
artifact should stay with that repository.

Place accepted skills in one of these directories:

- `skills/software-engineering/<skill-name>/`
- `skills/research-publication/<skill-name>/`

Categories organize the source tree. Do not add a category prefix to the skill
name.

## Required format

Every skill needs a `SKILL.md` whose frontmatter starts with:

```yaml
---
name: example-skill
description: Use when an agent must perform a specific recurring task. Do not use for a nearby but unsupported task.
---
```

The name must be unique, lowercase kebab-case, and identical to the immediate
directory name. Keep the description specific enough to explain both triggers
and boundaries. Add scripts, references, or assets only when the skill uses
them, and link every supporting file from `SKILL.md`.

Third-party submissions must identify the author, source, and licence. Do not
submit material when redistribution rights are unclear.

## Test locally

Read every changed instruction and supporting file. Then run:

```bash
npx skills add . --list
```

Confirm the changed skill appears exactly once. From a disposable directory
outside the repository, test individual installation with the local checkout:

```bash
npx skills add /path/to/braid --skill manuscript-revision --agent codex --copy -y
```

Replace the example skill and agent with the ones under test. Inspect the
installed directory and verify that all referenced resources were copied.

Before opening a pull request, also run:

```bash
git diff --check
```

Update `README.md` whenever the skill list or public installation workflow
changes.
