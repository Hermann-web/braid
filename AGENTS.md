# Repository guidance

- Preserve the Agent Skills format. Every skill must have a `SKILL.md` with
  valid YAML frontmatter.
- Keep skill names unique, lowercase kebab-case, and identical to their
  immediate directory names.
- Keep reusable skills independent of machine paths, private repositories,
  fixed internal files, organizations, and unpublished workflows.
- Do not vendor third-party skills without an explicit authorship and licence
  decision.
- Put each skill directly under one category in `skills/`. Categories organize
  the repository and do not change installed skill names.
- Update `README.md` when adding, removing, or renaming a skill.
- After structural changes, run `npx skills add . --list` and verify individual
  installation from a disposable directory.
- Prefer Markdown and existing ecosystem commands. Do not add a build system,
  package manifest, dependency, or custom validator unless it solves a proven
  recurring problem.
