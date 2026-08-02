---
name: paper-support-release
description: Build, audit, synchronize, clean, tag, publish, or deposit reader-facing repositories and archives that support scientific papers. Use for public support repositories, offline source-to-public-repository synchronization, evidence or software archives, DOI deposit packets, release licences and rights scopes, public manifests, and decisions about what publication-support material may be public. Do not use for internal backups, ordinary software releases, or manuscript editing.
---

# Paper Support Release

Treat a paper-support repository as a public scientific projection. It is not a
backup of the development repository, a submission workspace, or a record of
the team's internal process.

## Audience Contract

Every included file must answer both questions:

1. Which paper claim, table, figure, method, or verification step does it
   support?
2. Why does a reader need this exact file?

Exclude the file when either answer is absent. Operational convenience is not
a reader-facing role.

## Required Inventory

Build from an exact allowlist or a typed manifest of exact paths and public
roles. Fail closed when a path is absent, duplicated, differently licensed, or
not assigned a role. Never select a whole development, package, manuscript, or
documentation subtree and try to repair it with exclusions.

Allowed roles are:

- reader introduction and verification instructions;
- machine-readable evidence used by a paper;
- generated tables, figures, supplementary ledgers, and factual projections;
- exact scientific protocol or method contracts intended for readers;
- minimal source code and lockfiles required to regenerate or verify included
  outputs;
- checksums, content manifests, citation metadata, and release provenance;
- explicit licence, rights-scope, and third-party exclusion records; and
- a manuscript or supplement only when publication intent and rights explicitly
  require it.

Dependency closure may include a source file only when a selected public build
entry point actually needs it. Record the dependency role. Do not include an
entire application, web interface, CLI, test suite, or package because finding
the dependency graph is inconvenient.

## Forbidden Public Material

Reject these paths and equivalent content:

- journal choice, fallback venue, APC, submission strategy, or editorial plan;
- engineering plans, task ledgers, agent instructions, skills, prompts, and
  playbooks;
- research memos, scratch notes, local audit logs, and historical work diaries;
- submission-readiness reports, internal checklists, reviewer responses, and
  owner-only publication decisions;
- private legal or governance handbooks and internal decision records;
- credentials, tokens, telephone numbers not meant for readers, absolute local
  paths, private infrastructure, and unpublished personal data;
- provider payloads, third-party publications, or restricted material unless a
  recorded right explicitly permits redistribution;
- raw captures retained only for internal evidence audit;
- unrelated runtime, user-interface, experiment, or development code; and
- superseded drafts or historical snapshots that the paper does not cite.

Do not treat a blacklist as the primary boundary. Forbidden-name and
forbidden-content checks are defence in depth after an allowlist.

## Rights Contract

Keep asset classes separate:

- original repository software uses the owner-recorded software licence;
- project-authored evidence records use their separately recorded evidence
  licence;
- provider payloads retain provider terms and are excluded unless explicit
  redistribution rights exist;
- third-party software and publications retain their own terms.

Never infer a licence, rights holder, author, redistribution permission, or DOI
policy. Require an owner-recorded decision. Put concise public scope text and
the applicable licence files at the release root. A public rights file may
state exclusions, but it must not cite a private handbook as authority.

## Workflow

1. Read the paper's generated-fact and build contracts.
2. Define the reader audience and exact support outputs.
3. Trace the minimal regeneration and verification dependency graph.
4. Assign every exact path one public role and one rights class.
5. Record the expected public repository owner, name, remote, asset set, and
   release version in a typed authority or exact manifest.
6. Build from a clean committed revision using repository object bytes.
7. Synchronize into a dedicated target and verify it standalone.
8. Generate a fresh isolated repository history. Never preserve excluded files
   in public Git history.
9. Verify two builds from the same revision have identical checksums.
10. Verify in an isolated extraction with the declared lockfile and canonical
   commands.
11. Audit paths and content for all forbidden categories, secrets, symlinks,
   stale generated files, unresolved citations, and absolute local paths.
12. Inspect the complete public file list and reader README before publication.
13. Create a draft GitHub release from the audited commit and attach only the
    declared assets.
14. Verify the draft tag target and every remote asset by name, byte count, and
    SHA-256, independent of API response order.
15. Publish once, then verify the unauthenticated public landing page, tag,
    commit, and assets before recording their identities.
16. Record the public URL, tag, commit, asset checksums, and DOI only after the
    external records exist.

If a pre-release tag or public history exposes private or irrelevant material,
delete the tag, rebuild from the corrected inventory, replace the public branch
with fresh history when publication state permits, and verify the remote again.
Do not leave sensitive content recoverable through ordinary repository history.

## Source-To-Target Synchronization

The synchronizer is a deterministic exporter, not a release operator. Use these
constraints:

- accept an explicit target repository, with a documented sibling default;
- refuse a missing target and refuse a Git repository whose `origin` is not the
  exact recorded public remote;
- export from one clean committed source revision, using Git object bytes when
  source state is part of the release identity;
- replace only the typed allowlisted public projection;
- run the target's own offline verifier, tests, generated-count checks, and
  stale checks from inside the target;
- report the target diff for human review; and
- never commit, tag, push, create a release, move a tag, or rewrite public
  history from the synchronization script.

Prefer a dependency-free verifier when the release consists of data and simple
derived facts. Otherwise include the exact lockfile and prove installation and
verification from an isolated extraction without the parent checkout. Network
access must not be required to verify already released bytes.

The development repository owns exporters, GitHub API clients, finalizers,
tests, plans, and publication operations. The reader repository owns only the
paper-support projection and its minimal standalone verifier. Do not export
private machinery merely because it produced public bytes.

## GitHub Publication Contract

Before creating a public commit, verify all of these explicitly:

- `git remote get-url origin` equals the recorded `git@github.com:<owner>/<repo>.git`
  or its exact HTTPS equivalent;
- the target worktree and index contain only the reviewed projection;
- `git config user.name` and `git config user.email` contain the intended public
  commit attribution;
- no existing tag or release uses the proposed version; and
- immutable releases are enabled when the repository supports them.

Take the repository owner and commit identity from the recorded release
authority. The commit email does not determine repository ownership. Never
derive an owner from an email address or a local directory name.

Build release archives outside the tracked public tree. Create the public commit
only after the target verifies. Create an annotated tag only after auditing that
commit. Use a new semantic version for every changed public identity. Never move
or replace a tag cited by a paper.

Upload through a draft release so an incomplete asset set is not public. The
declared manifest, not API ordering, defines the expected assets. Reject missing,
extra, renamed, or duplicate assets. Compare remote byte counts and SHA-256
digests to local archives before publication. Keep credentials out of commands,
logs, manifests, and repository files.

After publication, verify without credentials. The finalizer may record only
facts observable from the public endpoint: repository URL, release URL, tag,
tagged commit, source revision, asset names, byte counts, and digests. A DOI or
external registration remains absent until that external record actually
exists.

If an audited projection requires a fresh public repository history, construct
that history in an isolated temporary repository and push it only while no
immutable cited release exists. Once a release is cited or immutable, preserve
history and cut a new version for corrections.

## Acceptance

A release is complete only when:

- the exact inventory is machine-validated and human-readable;
- every file has a paper-support role and correct rights scope;
- no forbidden path or content is present in the tree or retained history;
- canonical rebuild and stale checks pass from an isolated extraction;
- deterministic archive and repository checksums pass;
- the synchronization script performed no Git publication side effect;
- the public remote and commit identity were checked explicitly;
- citation metadata points to the exact public identity;
- the repository contains no new tag until all prior checks pass;
- the published release exposes exactly the manifest-declared assets and their
  verified byte identities; and
- the engineering plan records external publication facts without exporting
  internal planning material.

When this skill and a broad existing release builder disagree, the builder is
defective. Narrow it before publishing.
