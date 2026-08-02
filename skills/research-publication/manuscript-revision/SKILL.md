---
name: manuscript-revision
description: Use when revising a scientific manuscript for journal retargeting, section rewrites, claim-evidence alignment, terminology cleanup, figure or table synthesis, or concise scientific emails to supervisors and coauthors. Do not use for general copyediting that has no scientific claim, evidence, or publication context.
---

# Manuscript Revision

Use this skill for scientific writing and revision work in a repository.

## What this skill is for

- Retargeting a manuscript to a different journal
- Tightening abstract, introduction, discussion, and conclusion
- Making claims match the numerical evidence
- Distinguishing novelty from prior work without overstating
- Reorganizing results into a more reviewer-friendly structure
- Cleaning terminology that has drifted or become inconsistent
- Writing short progress emails to supervisors or coauthors

## First steps

1. Preserve scientific precision over stylistic polish.
2. Identify the target journal and rewrite toward its standards, not toward a generic ML venue.
3. Before editing, locate the manuscript file and any local notes or revision memos.
   Read the view's own writing contract when it has one, such as
   `redaction-rules.md`, `submission-guidelines.md`, or a writing plan.
   Those rules win over this skill's generic guidance.
4. If the manuscript has benchmark tables or figures, treat the paper as a single argument:
   - abstract
   - introduction
   - results
   - discussion
   - conclusion
   must all say compatible things.
5. Check whether the user wants analysis only or direct edits. Default to direct edits when the request is operational.

## Core workflow

1. Determine the paper's real contribution.
   - What is actually new?
   - What comes from prior work?
   - What is only an empirical trend rather than a theorem-level claim?
2. Rewrite the positioning.
   - Name the closest literature explicitly.
   - State the difference in scope, objective, or formulation.
   - Avoid vague claims like "novel architecture" when the real novelty is in the inductive bias, layer organization, or coupling with losses.
3. Align claims with evidence.
   - If results are mixed, say mixed.
   - If a comparison exists only for some benchmarks, limit the claim to those benchmarks.
   - Do not generalize from one regime to all regimes.
4. Improve the result narrative.
   - Group benchmarks by problem family when useful.
   - Add one synthesis table if the benchmark list is long.
   - Reduce repetitive local commentary around "predicted vs true" plots.
5. Recheck the terminology after the edit pass.

## Reviewer-facing positioning

For selective inverse-problems and scientific-computing journals, make the novelty explicit instead of implying it.

- Add a contribution list near the end of the introduction.
- If part of the method is inherited from prior work, say so and then state the actual novelty.
  - Example: `Born implies convolutional structure` may be prior art.
  - Then state what is new: extension to semi-linear PDEs, constructive architecture design, coupling with weak-form losses, multi-system validation.
- Name the closest prior work and distinguish against it concretely:
  - problem class
  - learning target
  - role of theory in architecture design
  - loss formulation
- If the manuscript is close to one specific line of work, add an explicit paragraph such as `Relation to X (Year)`.

## State-of-the-art comparison discipline

Do not stop at citing related families. State how this paper differs from them.

- For operator-learning papers, distinguish:
  - architecture derived from inverse-operator structure
  - generic global operator approximation
  - parameter identification vs solution-operator learning
- For PINN-family papers, distinguish:
  - strong-form residuals
  - weak-form / VPINN-style enforcement
  - whether physics enters the loss, the architecture, or both
- If the user mentions specific families such as `Ying`, `DeepONet`, `FNO`, or `VPINNs`, add an explicit qualitative comparison rather than a passing citation.
- If only some baselines are available experimentally, keep the comparison qualitative and say that directly.

## Terminology discipline

Be precise with scientific terms. Do not "simplify" away meaningful distinctions.

- `weak-form` and `variational` are related but not interchangeable.
  - In methods/results, prefer `weak-form residual` or `weak-form loss` when describing the optimized quantity.
  - In positioning, use `variational formulation`, `variational loss`, or `VPINN-style` when connecting to that literature.
  - Use both together only when the sentence genuinely needs both ideas.
- Do not replace `variational` mechanically if the method is explicitly framed through weak/variational enforcement.
- Avoid calling everything an `architecture` if the point is really the layer organization or model family.
  - Prefer `network`, `model`, `layer organization`, or `design` when that is what is meant.

## Results and discussion strategy

For benchmark-heavy papers, do not leave the reader with a sequence of disconnected case studies.

- Group results by scientific family when possible.
  - Example: linear PDEs, semi-linear PDEs, chaotic dynamics
- Keep detailed per-benchmark tables if needed, but add one cross-benchmark synthesis table.
- Replace repeated single-benchmark prediction figures with grouped multi-panel figures when the visual pattern is the same.
- Use the discussion to extract a few robust cross-benchmark messages.
- Avoid aggregate metrics across incompatible problems unless they are normalized or rank-based.

## Models and evaluation discipline

For method sections, separate three things cleanly:

- problem equations;
- model explanations;
- training and evaluation formulas.

Do not write architecture equations unless the manuscript genuinely studies a
new mathematical operator. For finite-parameter regressors, prefer:

- prose explaining what each carrier does;
- architecture figures placed near that explanation;
- explicit references to the implementation or benchmark memo when needed.

When the repository already contains benchmark-side documentation, reuse it
instead of improvising a second incompatible description. In this repository,
that often means:

- benchmark/problem mechanics from project readmes or benchmark-suite notes;
- model-family positioning from local design memos;
- loss and metric formulas from the actual trainer and collector code.

Evaluation sections must be code-grounded.

- If training uses normalized MSE, say normalized MSE.
- If best-model selection uses validation MAE, say validation MAE.
- If reported metrics come from exported artifacts such as early-window MAE,
  spike count, or observation activity summaries, define those quantities
  exactly as written by the code.
- Do not describe a metric family more broadly than the current implementation
  supports.

## Figure placement discipline

Figures should support the text flow rather than interrupt it.

- Introduce every figure in prose before the figure environment appears.
  - The reader should know why the figure is coming before they see it.
- Refer to the figure explicitly in the surrounding sentences, not only in the
  caption.
- Keep interpretation integrated with the paragraph logic:
  - introduce the figure,
  - place the figure,
  - continue the prose with the relevant reading.
- Avoid isolated patterns such as:
  - one sentence,
  - a figure,
  - then a disconnected interpretation block.
  Prefer the style where the figure is one piece of an already ongoing
  argument.

Anchoring and sizing are one decision, not two. When the template allows
it, prefer `\usepackage{float}` with `[H]` so a figure stays at its first
substantial discussion, and then size that figure so anchoring it does
not push a large white gap onto the page. A figure small enough to sit
inside the running argument is what makes `[H]` safe; an oversized
anchored figure is what creates the gaps.

- Place each figure close to its first meaningful discussion, and keep it
  small enough to stay there without breaking the page.
- Size figures for reading, not for maximal occupancy:
  - if a figure remains legible at smaller width, reduce it;
  - avoid near-full-width figures unless the visual content genuinely requires
    that width.
- In long manuscripts, a smaller figure with continuous explanatory text is
  usually better than a large figure isolated by whitespace.
- Captions should explain the scientific reading, but the figure footprint
  should stay compact enough that the page still reads like prose.
- If a figure genuinely needs a large footprint and cannot be reduced,
  let it float to the top or bottom of the page rather than forcing `[H]`
  and stranding half a page of whitespace.
- With anchored figures, keep the prose pattern explicit: introduce the
  figure, place it, then continue the same argument immediately after it.
  Do not leave the interpretation several paragraphs later.
- Check the rendered pages after changing figure size or placement. Gaps
  and stranded floats are only visible in the PDF.

## Claims checklist

Before finalizing, verify these questions:

- Does the abstract promise only what the results section shows?
- Does the discussion distinguish stable trends from benchmark-specific behavior?
- Are limitations visible, not buried?
- Is the relation to prior work explicit and defensible?
- If a phrase sounds stronger than the table/figure evidence, weaken the phrase.
- Does the manuscript separate architectural conclusions from loss-function conclusions?
- Does the paper say when the method fails or when its assumptions stop being credible?

## Standalone framing discipline

Write for a reader who has not seen the internal experiment history.

- State the supported claim directly before discussing its scope.
- Prefer scope-first wording such as:
  - `the method is supported in timestamp-jittered event-trace settings`
  - `the strongest evidence appears in low-data and low-budget regimes`
- Avoid internal-opposition phrasing such as:
  - `this kills the broad claim`
  - `the method is not general`
  - `the reader should not think X`
  unless the manuscript is explicitly criticizing a prior published claim.
- When limitations matter, express them as boundaries of the present evidence:
  - `the current evidence is concentrated on ...`
  - `the present study establishes ... and leaves ... for future work`
  rather than as debate-style negations.
- Result sections should read like a complete argument on their own, not like a
  response to an unseen previous draft.

## External report triage

If the user pastes a journal checker or language-tool report, triage it against the manuscript instead of trusting it blindly.

- Treat generic `structured abstract` warnings cautiously; many target journals do not require one.
- Verify `uncited figures/tables` against actual `\\ref{}` usage before editing.
- If the checker reports `figure legends out of order`, inspect float placement and numbering before rewriting captions.
- Prioritize issues that affect scientific defensibility:
  - novelty framing
  - unsupported claims
  - prior-work comparison
  - reproducibility
  - visible limitations

## Reproducibility expectations

For strong journal submissions, `available on reasonable request` is weak unless the user explicitly cannot publish the code.

- Prefer a real repository link when available.
- If no public repository exists, flag this as an unresolved submission risk.
- Check whether the manuscript still contains placeholder repository text or commented-out availability notes.

## Repository and build discovery

Do not assume a default manuscript or build command.

1. Identify the requested manuscript and inspect nearby repository guidance,
   submission rules, revision notes, and build scripts.
2. Determine whether shared source feeds several maintained manuscript
   variants. Rebuild every affected variant after editing shared content.
3. Use the repository's canonical build and bibliography workflow. Do not
   hand-assemble bibliography files or replace a working build with a generic
   command.
4. If no build workflow exists and the manuscript is compatible with Tectonic,
   use the bundled `scripts/build-tectonic.sh` helper:

```bash
bash <skill-directory>/scripts/build-tectonic.sh path/to/main.tex
```

The helper requires an existing `tectonic` executable. It does not install
dependencies or invent a bibliography aggregation policy.

After a build:

- read the command output and any retained log;
- resolve undefined citations and references;
- confirm rerun warnings have converged before trusting numbering; and
- inspect changed PDF pages visually for float placement, white gaps, clipping,
  and figure legibility.

## Short scientific emails

When writing to supervisors or coauthors:

- Start with the decision context
- List only the scientifically relevant updates
- Keep bullets concrete
- Avoid generic wording like "improved the manuscript"
- Prefer:
  - repositioned the paper toward journal X
  - clarified novelty relative to Y
  - added a synthesis table
  - aligned claims with numerical evidence

## Output standard

A good revision should leave:

- sharper novelty statement
- tighter terminology
- fewer reviewer openings on overclaiming
- clearer cross-section coherence
- a manuscript that reads like one argument rather than several disconnected edits
