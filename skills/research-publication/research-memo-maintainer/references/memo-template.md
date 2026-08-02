# Research Memo Template

Use this only as a shape reference. Do not copy it mechanically if the project
needs fewer or more chronological phases.

The point of this template is not just formatting. It also demonstrates:

- tight memo subsections with no loose prose
- explicit benchmark declaration
- explicit claim boundaries
- a paper-phase section that links to protocol artifacts instead of absorbing
  them
- explicit revision language when later evidence changes the story

```md
# Project Memo

- **Date:** YYYY-MM-DD
- **Purpose:** experiment-first historical memo for <project>
- **Related docs:** [docs/engineering-plan.md](...), [docs/artifacts](...), [docs/raw-memo.md](...)

## 1. Initial Framing

### [research] Task And Dataset Triage

**Why we're here:**
- the project needed a first task and a first dataset.

**What is done:**
- surveyed task families.
- shortlisted candidate datasets.

**Result obtained:**
- selected dataset A for correctness.
- selected dataset B for the main research target.

**Interpretations:**
- [light] dataset A is best for validation. It is the simplest honest way to prove the stack works.
- [light] dataset B is best for the paper lane. A positive result there would matter more scientifically.

**Insights for the goal:**
- use dataset A to validate the port. This keeps early failures easy to diagnose.
- use dataset B to pursue the main claim. This keeps the project focused on the most meaningful target.

**Sources:**
- dataset A: [link](https://example.com).
- dataset B: [link](https://example.com).

## 2. First Implementation

### [software] Initial Path Review

**Why we're here:**
- the first implementation existed but was not yet trustworthy.

**What is done:**
- reviewed parsing, loading, labels, metrics, and evaluation.

**Result obtained:**
- found issue 1.
- found issue 2.

**Interpretations:**
- [light] the implementation direction was right. The broad architecture can be kept.
- [light] some early assumptions would have invalidated later experiments. The code could run while still being scientifically wrong.

**Insights for the goal:**
- recover correctness before optimizing. Fast experiments on wrong labels are wasted.

## 3. First Real Results

### [experiment] Baseline Real-Data Run

**Why we're here:**
- the project needed the first real-data measurement.

**What is done:**
- trained the first baseline.
- evaluated on the frozen split.
- wrote the benchmark surface to [docs/artifacts/dataset-b-baseline-protocol.md](...).

**Result obtained:**
- benchmark surface: subject-wise `5`-fold split, lead `0`, `30 s / 15 s` windows, seed `33`.
- eval: `metric_a=...`, `metric_b=...`, `metric_c=...`.
- claim boundary: this surface supports an internal baseline claim, not a head-to-head published-SOTA claim.

**Interpretations:**
- [light] the path is real. The stack can train and evaluate end to end.
- [dim] the current setup is not yet publication-grade. The gap to literature is still large.

**Insights for the goal:**
- keep this as the first honest baseline. All later gains should be compared against it.

**Sources:**
- baseline comparator: [link](https://example.com).

## 4. Pivot

### [experiment] Objective Narrowing

**Why we're here:**
- the baseline showed one part of the task was much stronger than the rest.

**What is done:**
- re-evaluated results by subtask.
- froze a narrower benchmark.
- wrote the narrowed surface to [docs/artifacts/narrow-task-protocol.md](...).

**Result obtained:**
- full task: `...`.
- narrow task: `...`.
- claim boundary: the narrow surface removes difficulty X, so it supports a localization-first claim rather than a full-task superiority claim.

**Interpretations:**
- [light] the model is structurally aligned with the narrow task. Its best behavior shows up there consistently.
- [lightmaybe] the narrow task may be the best paper lane. It is strong enough to justify focused optimization.

**Insights for the goal:**
- optimize the strongest lane first. It is better to win a well-motivated subproblem than to stay weak on a broader one.

## 5. Ablations

### [experiment] Input Ablation

**Why we're here:**
- the next hypothesis was that the input surface might be the bottleneck.

**What is done:**
- benchmarked `raw`.
- benchmarked `cleaned`.
- benchmarked `raw + auxiliary`.

**Result obtained:**
- `raw`: `...`.
- `cleaned`: `...`.
- `raw_aux`: `...`.

**Interpretations:**
- [dim] generic cleaning did not help. The key information was already available in the raw signal.
- [lightmaybe] the real lever may be elsewhere. Input changes did not move the target enough.

**Insights for the goal:**
- stop assuming preprocessing helps. Future input changes must beat raw explicitly.

**Sources:**
- tooling doc: [link](https://example.com).

## 6. Current State

### [experiment] Best Current Result

**Why we're here:**
- the memo needs one current reference point.

**What is done:**
- compared all major branches on the main benchmark.

**Result obtained:**
- best checkpoint: `...`.
- best metrics: `metric_a=...`, `metric_b=...`, `metric_c=...`.
- claim boundary: this result supports claim X but does not yet support broader claim Y.

**Interpretations:**
- [light] the project now has one clearly strong lane. There is now a result worth building around.
- [dim] some broader claims are still not justified. The strong result does not automatically generalize to every framing of the task.

**Insights for the goal:**
- build outward from the current best checkpoint. Do not restart from older weaker regimes.

## 7. Paper Path

### [research] Paper Readiness And Narrowed Claim

**Why we're here:**
- one line of evidence became strong enough to support a paper-facing claim.

**What is done:**
- checked the closest direct comparators.
- checked whether the strongest current result supports a broad claim or only a narrowed one.
- froze the paper protocol in [docs/artifacts/paper-protocol.md](...).

**Result obtained:**
- broad claim: not yet justified.
- narrowed claim: strong enough to support a paper campaign.
- paper protocol artifact exists and defines the reproducible surface for the next comparisons.

**Interpretations:**
- [paperfacing] the project now has one narrow problem worth optimizing as the main paper surface. This is the point where the memo should stop exploring broadly and start extracting the strongest defensible result on that narrowed problem.

**Insights for the goal:**
- freeze the narrowed paper target. The next work should improve one claim well rather than keep widening the search again.

**Sources:**
- direct comparator: [link](https://example.com).
- venue or review context: [link](https://example.com).

### [experiment] Same-Protocol Baseline Versus Best Regime

**Why we're here:**
- once the claim is paperfacing, same-protocol comparison quality matters as much as the next tuning idea.

**What is done:**
- ran the frozen baseline regime on the paper protocol.
- ran the best-current regime on the same paper protocol.
- stored the exact commands and fold definitions in [docs/artifacts/paper-protocol.md](...).
- stored the dense tables in [docs/artifacts/paper-results.md](...).

**Result obtained:**
- baseline regime: `metric_a=...`, `metric_b=...`, `metric_c=...`.
- best-current regime: `metric_a=...`, `metric_b=...`, `metric_c=...`.
- revision: the earlier small-split improvement did not fully carry over to the broader mixed-task paper protocol, but the localization-first gain remained.

**Interpretations:**
- [light] the work is now evidence-producing, not merely exploratory. The paper claim now rests on a frozen protocol rather than a lucky checkpoint.
- [light] the model improves the narrowed target more than the broader mixed task. That difference is now part of the scientific story, not a side note.

**Insights for the goal:**
- center the paper on the narrow claim that survived the broader protocol.
- keep the broader-task weakness explicit instead of trying to hide it.

### [research] Final Stop Rule

**Why we're here:**
- the project needs to know when the paper evidence is sufficient.

**What is done:**
- defined the minimum evidence package required for the paper claim.

**Result obtained:**
- required evidence package:
  - same-protocol baseline table
  - repeatability summary
  - subtype breakdown if scientifically central
  - temporal or other main-text ablation if central to the claim
- stop condition: once those artifacts exist and the claim boundary remains honest, further exploration is optional rather than mandatory.

**Interpretations:**
- [light] the paper campaign now has a stop point. This prevents endless tuning after the core evidence is already in hand.

**Insights for the goal:**
- once the evidence package is complete, either write the paper around the honest claim or downgrade ambition. Do not keep searching indefinitely for a different story.
```
