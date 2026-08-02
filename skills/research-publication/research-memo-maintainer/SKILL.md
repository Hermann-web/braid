---
name: research-memo-maintainer
description: Use when a research project needs an experiment-first `research-memo.md` or `memo.md` maintained in historical order with scientific provenance, measured results, negative findings, software changes, protocol boundaries, and claim revisions. Use for a durable record of what was tried and what the evidence supports. Do not use for engineering plans, task lists, changelogs, or one-off result summaries.
metadata:
  short-description: Maintain an experiment-first research memo
---

# Research Memo Maintainer

Write and maintain a durable research memo for serious side projects.

The memo is not a plan, not a changelog, and not a dumping ground for protocol
details. It is a historical research record of what happened, what was
measured, what changed, and what those results now justify.

Read [references/memo-template.md](references/memo-template.md) before writing a
new memo or heavily restructuring an existing one.

## When to use

Use this skill when:

- the user wants a long-lived `memo.md`, `research-memo.md`, or similar file
- the project has meaningful experiments, literature review, and implementation
- the user wants historical order rather than topical grouping
- the user wants negative results preserved, not hidden
- the user wants explicit provenance and claim boundaries in the memo itself
- the project has started to accumulate enough branches that a plain notebook or
  artifact folder no longer tells a coherent story

Do not use this skill for:

- engineering plans
- task lists
- PR descriptions
- casual notes
- one-off result summaries with no durable maintenance need
- speculative protocol documents that contain no measured outcome yet

## Core memo contract

The memo must be:

- experiment-first
- historical
- concise
- source-aware
- honest about failures
- explicit about claim boundaries
- readable by both experts and attentive non-experts

The memo must answer:

- why a step happened
- what was actually done
- what measurable or qualitative result came out
- what that result means
- what it implies for the project goal
- what the result does and does not justify claiming

## Required structure

Use exactly this structural pattern unless the user explicitly overrides it:

- `#` for the document title
- `##` for major chronological sections
- `###` for chronological subsections
- each subsection title should start with one tag:
  - `[research]`
  - `[experiment]`
  - `[software]`

Inside each subsection, use this exact field order:

1. `**Why we're here:**`
2. `**What is done:**`
3. `**Result obtained:**`
4. `**Interpretations:**`
5. `**Insights for the goal:**`

Optional final field:

6. `**Sources:**`

Rules:

- each field is followed by flat bullet points
- do not leave loose prose directly under a `##` or `###` heading
- do not insert mini-essays, command transcripts, or free-form planning blocks
  between the required fields
- if the subsection has no external provenance need, omit `**Sources:**`
- if a subsection is about a frozen protocol or benchmark surface, it still must
  use the same five memo fields

## Interpretation style

Interpretation bullets must use one of these evidence-strength tags:

- `[dead]` for a path that is effectively ruled out unless a major premise changes
- `[dim]` for a path that looks weak or mostly ruled out
- `[lightmaybe]` for a plausible but not settled interpretation
- `[light]` for a strong signal from current project evidence
- `[paperfacing]` for an interpretation mature enough to support outward-facing
  framing in a paper, abstract, or comparison section

Each interpretation bullet should have:

- a concise expert judgment first
- then one plain-language follow-up sentence

Do not use `[paperfacing]` casually. It means the line of evidence is mature
enough that future work should become disciplined extraction of a defensible
claim, not open-ended exploration.

## Expert-question closure rule

The skill must reduce the need for a separate “questions” document.

When reading or updating a memo, actively look for obvious expert-reviewer
questions that arise from missing information. For each likely question, do one
of these:

1. answer it directly in the memo subsection
2. answer it in a tightly linked artifact and cite that artifact in the memo
3. state explicitly that the answer is not yet known and therefore the claim is
   limited

If answering the question would require a new experiment, broader split, or new
analysis that does not exist yet, say that plainly and narrow the claim now.

Do not create a separate “presentation questions” or “unanswered questions”
document by default. First try to close likely questions inside the memo or in
tightly linked artifacts. Create a separate Q&A-style document only when:

- the user explicitly asks for one
- the deliverable is presentation, defense, or review prep
- the question set is large enough that embedding it in the memo would harm readability

High-priority question classes to close:

- dataset composition and label meaning
- split and subject-grouping policy
- benchmark surface definition
- metric definitions and units
- lead/channel choice
- train/eval protocol comparability
- baseline fairness
- literature comparator comparability
- what is and is not being claimed
- whether a later result revises an earlier conclusion

## Benchmark declaration rule

Whenever the memo introduces a new benchmark surface, protocol surface, or
headline result surface, make sure the reader can recover these facts from the
memo and its linked artifacts without guessing:

- dataset or manifest names
- subject or record composition when relevant
- whether grouping is subject-wise or record-wise
- lead/channel choice
- window duration and stride if applicable
- seed policy if it matters to interpretation
- metric family and units
- what the surface removes or conditions on, if anything
- what claim this surface can support and what claim it cannot support

These facts do not all need to live in one memo subsection. They may live in a
linked artifact, but the memo must point to that artifact explicitly.

For benchmark-defining or paper-facing experiment subsections, the memo should
still contain a minimal in-memo benchmark declaration even when the full
protocol lives in an artifact. At minimum, make it easy to recover:

- benchmark or manifest name
- grouping mode if relevant, such as subject-wise vs record-wise
- lead/channel choice if relevant
- window duration and stride if relevant
- one-sentence claim boundary describing what the surface supports and what it does not support

## Memo versus artifact boundary

Keep the memo lean. Put bulky detail in artifacts.

The memo owns:

- historical sequence
- pivots
- negative findings
- key numeric outcomes
- interpretation and claim boundaries
- explicit references to the durable artifacts that define a benchmark or claim

Artifacts own:

- exact commands
- full protocol manifests or fold lists
- full result tables
- figure inventories
- long comparator tables
- schema details
- dataset contracts
- reproduction runbooks

Bad memo pattern:

- a subsection that turns into pages of shell loops, fold filenames, and figure
  shopping lists

Good memo pattern:

- a subsection that says the protocol was frozen, names the artifact that holds
  the exact protocol, reports the key result, and states what changed

## Historical-order and revision rules

The memo must tell the project story in time order.

That means:

- preserve dead ends in the order they happened
- do not regroup failures into a timeless bucket after the fact
- show how one result changed the next decision
- make pivots explicit
- keep earlier wrong or weaker interpretations when they mattered historically
- when a later result overturns an earlier interpretation, state that revision
  explicitly rather than silently replacing the old story

Use clear revision language such as:

- “this revised the earlier conclusion that ...”
- “the earlier small-split result did not hold under the broader protocol”
- “the earlier apparent collapse turned out to be specific to surface X, not to
  the broader paper protocol”

## Paperfacing transition rule

When a line of evidence reaches `[paperfacing]`, the memo should visibly change
phase.

Add a later historical section such as:

- `## Paper Path`
- `## Paper Campaign`

In that section:

1. state what broad exploration is no longer worth spending time on
2. state what narrow problem now carries the paper
3. state where the exact protocol is frozen
4. report the measured results produced under that protocol
5. separate stable paper-facing evidence from still-exploratory ideas

Important:

- the memo may record that a protocol was frozen
- the memo may summarize the protocol in a few bullets
- the memo should not absorb the full protocol artifact

If no measured result exists yet, do not pretend the memo has a completed paper
campaign. Keep speculative execution order in a plan or artifact, not in the
main research narrative.

When the paper phase includes regime comparisons, prefer a same-protocol
comparison subsection in the memo itself, usually baseline regime versus
best-current regime on the same frozen surface. Full tables may live in
artifacts, but the memo should state the comparison and its conclusion
directly.

## Result style

Results must be dense and concrete.

Rules:

- prefer numeric metrics over adjectives
- keep related metrics on one bullet when possible
- explicitly separate train/eval settings when needed
- if a result is qualitative only, say that directly
- if a result is compared to literature or baseline, say against what
- if units matter, name them
- if the evaluation surface is nonstandard or narrowed, say so directly

Good:

```md
**Result obtained:**
- AF-positive localization eval on `cpsc2021-localization-eval.txt`: `episode_f1=0.9455`, `mean_matched_iou=0.9978`, `onset_delay=0.0100 s`, `offset_delay=0.0124 s`, `burden_error=0.9374`.
```

Bad:

```md
**Result obtained:**
- performance improved a lot.
```

## Provenance rules

Scientific provenance is mandatory.

When literature, datasets, tooling docs, or web research informed a subsection,
add:

`**Sources:**`

Use flat bullets with explicit markdown links.

Add sources especially for:

- dataset choice
- literature comparison
- claims like “not SOTA”, “closest comparator”, or “Q1”
- preprocessing or tooling choice
- venue fit
- any external fact not already contained in durable repo artifacts

Do not make the reader hunt through side artifacts to find provenance for a key
claim.

## Maintenance workflow

When updating an existing memo:

1. Read the current memo first.
2. Read the latest durable artifacts, plans, and result notes that changed since
   the last memo update.
3. Identify any new contradictions, stale claim boundaries, or missing closure
   on obvious reviewer questions.
4. Do not rewrite the entire memo unless structure is broken.
5. Prefer appending or tightening the affected chronological sections.
6. Preserve prior negative findings unless they were factually wrong.
7. If a later result overturns an earlier interpretation, keep both and state
   the revision explicitly.

## Writing workflow

When creating or revising a memo:

1. Build a chronological event list from repo artifacts, user notes, logs, and
   prior memo text.
2. Group events into `##` sections by phase.
3. Write `###` subsections as one event or one tightly related cluster.
4. Keep `What is done` factual and procedural, but not overloaded with protocol
   bulk better stored elsewhere.
5. Keep `Result obtained` metric-dense.
6. Keep `Interpretations` short, explicit, and tagged by evidence strength.
7. Keep `Insights for the goal` action-oriented.
8. Add `Sources` where outside research informed the work.
9. When a new benchmark surface appears, ensure the benchmark declaration rule
   is satisfied.
10. When a line becomes `[paperfacing]`, add a later section that records the
    narrowed paper campaign without turning the memo into the protocol artifact.

## Anti-patterns

Do not:

- turn the memo into a changelog of file edits
- turn the memo into a plan with no measured result
- bury core claim limitations in side artifacts only
- silently contradict earlier memo claims
- create a second “questions” document to compensate for missing memo clarity
- paste long command loops into the memo when an artifact should own them
- present a narrowed benchmark without saying what real-world difficulty it removed
- present a tiny custom split as if it carried the same weight as a broader protocol

## Tone rules

- concise, not chatty
- factual, not motivational
- willing to say a path failed
- clear enough that a non-expert can follow the interpretation bullets
- dense enough that an expert does not feel slowed down
- disciplined enough to narrow once the evidence is strong enough

## Validation checklist

Before finishing, verify:

- the memo is in historical order
- every subsection has the required five fields
- no loose prose sits under section headings outside memo subsections
- research-heavy sections include `**Sources:**`
- result sections contain concrete numbers when available
- interpretations use only `[dead]`, `[dim]`, `[lightmaybe]`, `[light]`, or
  `[paperfacing]`
- insights explain what the result changes for the project
- negative results are preserved
- no standalone question-bank document was created unless the user explicitly
  asked for one
- obvious reviewer questions are answered, linked to an artifact, or explicitly
  marked as still unknown
- new benchmark surfaces satisfy the benchmark declaration rule
- if `[paperfacing]` appears, the memo later contains a narrowed paper-campaign
  section with measured outcomes and linked protocol artifacts
- paper-facing experiment subsections contain a minimal in-memo benchmark declaration
- if the paper claim depends on protocol quality, the memo links a frozen protocol artifact explicitly
- if the paper phase includes regime comparison, the memo contains or directly summarizes a same-protocol baseline-versus-best comparison
- the memo reads like a research record, not a changelog, protocol dump, or plan

## File placement

Default target filenames:

- `docs/memo.md`
- `docs/research-memo.md`

Default supporting artifact patterns when needed:

- `docs/artifacts/*-protocol.md`
- `docs/artifacts/*-results.md`
- `docs/artifacts/*-comparison.md`

If the user already has a memo file, continue using it unless told otherwise.
