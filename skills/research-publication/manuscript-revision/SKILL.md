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

1. Read `AGENTS.md` and preserve scientific precision over stylistic polish.
2. Identify the target journal and rewrite toward its standards, not toward a
   generic venue or house style.
3. Before editing, locate the canonical manuscript, bibliography sources,
   result artifacts, and any local notes or revision memos.
   Read the view's own writing contract when it has one, such as
   `redaction-rules.md`, `submission-guidelines.md`, or a writing plan.
   Those rules win over this skill's generic guidance.
4. Build a claim-evidence map for the central contribution. Each important
   claim should point to a result, table, figure, citation, or explicit
   limitation.
5. If the manuscript has result tables or figures, treat the paper as a single argument:
   - abstract
   - introduction
   - results
   - discussion
   - conclusion
   must all say compatible things.
6. Check whether the user wants analysis only or direct edits. Default to
   direct edits when the request is operational.

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

## Positioning and comparison discipline

Make the contribution explicit instead of implying it.

- Add a contribution list near the end of the introduction when the journal
  and manuscript length support one.
- If part of the method comes from prior work, state that inheritance before
  identifying the actual extension.
- Name the closest prior work and distinguish it through concrete dimensions:
  - scientific problem and assumptions;
  - data or observation regime;
  - learning or estimation target;
  - role of theory or domain knowledge;
  - method mechanism;
  - loss or objective;
  - evaluation protocol.
- Add a dedicated relation-to-prior-work paragraph when one paper or method
  family is the real comparison anchor.
- Keep comparisons qualitative when protocols are not comparable or direct
  experimental baselines are unavailable.
- Never describe an unmatched literature number as a head-to-head result.

## Terminology discipline

Be precise with scientific terms. Do not simplify away meaningful distinctions.

- Introduce an acronym with its full term on first use. If it appears only
  once or twice, use the full term and omit the acronym.
- Preserve formal distinctions between related terms. Do not replace a
  technically precise term with a near-synonym merely for stylistic variety.
- Avoid calling everything an `architecture` when the point is the model,
  mechanism, layer organization, or experimental design.
- Avoid convenience adjectives such as `reduced`, `simplified`, `toy`, or
  `baseline` unless the manuscript defines the exact scientific sense.
- Use `proposed` only to identify the authors' contribution. After the first
  definition, name the method directly.
- Keep scientific names separate from implementation aliases. Command flags,
  cache keys, and folder names belong in reproducibility material unless the
  manuscript needs them to identify an exact artifact.

## Emphasis discipline

Make wording, evidence, and structure carry emphasis.

- Avoid bold and italics used only for rhetorical force.
- Keep italics when notation, taxonomy, species names, or journal style
  requires them.
- In comparison tables, bold may mark a best value only when the comparison
  is fair, local, and defined in the caption.
- Rewrite a weak sentence instead of using typography to make it look
  important.

## Abstract discipline

Write the abstract as a compressed paper, not a teaser.

- State the scientific problem and why it matters.
- Identify the tested method, data, or experimental setting.
- Name the relevant comparison target.
- Report the central result with its metric or qualitative evidence.
- End with the supported scope or limitation.
- Remove broad impact language that the manuscript does not demonstrate.

## Introduction discipline

Make the introduction earn the research question before presenting the method.

- Build the motivation from scientific need to known gap or observation
  constraint, then state the research question.
- Define central objects and method families before using abbreviations or
  specialized cases.
- Name the closest work instead of hiding it in a long citation list.
- Make the comparison question explicit for comparative studies.
- End with concrete contributions, not a generic paper outline.

## Claim wording discipline

Write claims as evidence-bound scientific statements.

- State the condition, compared methods or groups, metric, and direction of
  the result when they matter.
- Prefer `has lower error under condition X` to competition language such as
  `wins`, `beats`, or `dominates`.
- Distinguish observation, association, estimation, and causal evidence.
- Match every claim to the actual aggregation, selection rule, uncertainty
  estimate, and evaluation surface.
- Do not turn a result from one regime, subgroup, or benchmark into a general
  property of the method.

## Citation discipline

Use citations to support concrete statements.

- Attach each citation cluster to the claim it supports.
- Separate citation roles when a paragraph covers application motivation,
  scientific background, method precedent, and benchmark precedent.
- Name the closest prior work in prose.
- Verify citation metadata and key resolution through the repository's
  bibliography workflow.
- Do not cite a review as the primary source when the original result is
  available and is the claim being discussed.

## Table discipline

Give every table one job.

- State what rows, columns, groups, and summary statistics mean.
- Put units and aggregation rules in headers or captions.
- Highlight best values only for comparable methods evaluated under the same
  protocol.
- Explain the intended comparison in the surrounding prose.
- Add a synthesis table when many detailed tables obscure the main pattern.

## Equation discipline

Include equations when they clarify the scientific object, method, or
evaluation logic.

- Define every symbol, operator, domain, condition, and parameter near first
  use.
- Keep scalar, vector, matrix, and tensor notation consistent.
- State which quantities are observed, fixed, estimated, or learned.
- Number equations that later text cites. Leave purely local display math
  unnumbered.
- Refer back to an equation only when it carries part of the argument.

## Paragraph discipline

Give each paragraph one main job, such as motivating a question, defining an
object, comparing results, explaining a figure, or setting a limitation.
Split paragraphs that mix several of these jobs, and use short transitions
between distinct parts of the argument.

## Results and discussion discipline

Do not leave the reader with disconnected case studies or a scoreboard.

- Explain why each experiment, cohort, benchmark, or case is scientifically
  necessary before reporting that it performs well.
- State the tested hypothesis and the quantities being evaluated.
- Group results by scientific question or problem family when useful.
- Keep detailed local results, but provide a cross-result synthesis when the
  central pattern is otherwise hard to recover.
- Avoid aggregate metrics across incompatible tasks unless normalization or
  ranking makes the aggregation defensible.
- Separate robust trends from subgroup-specific or protocol-specific effects.
- Use the discussion to explain mechanisms, controls, failures, and why
  effects differ across conditions.
- Ask what the strongest competing explanation still accounts for better.
- State which conclusions survive stricter metrics, controls, or follow-up
  analyses.

If several maintained manuscript variants share stable method text, use the
repository's existing include or shared-source mechanism. Keep venue-specific
framing and result subsets separate. Rebuild every affected variant.

## Methods and evaluation discipline

Separate the scientific problem, method explanation, training or fitting
procedure, and evaluation formulas.

- Put scientific choices in the method section: formulation, assumptions,
  observation contract, target definition, regularization, and method
  rationale.
- Put implementation details in the protocol when they affect evidence:
  sample counts, seeds, discretization, solver, time step, split policy,
  selection rule, and metric aggregation.
- Do not let internal class names, modes, or configuration keys define the
  scientific contribution.
- Name which quantities are learned or estimated and which are fixed by the
  experimental setup.
- Reuse code-grounded repository documentation instead of improvising a second
  incompatible method description.

Evaluation sections must match the implementation and persisted artifacts.

- Define every reported metric, unit, aggregation rule, and uncertainty
  summary.
- State how the best model, checkpoint, fit, or hypothesis was selected.
- Distinguish validation selection from final test reporting.
- Report exclusions, filtering, missing-data handling, and subgroup formation
  when they affect interpretation.
- Do not describe a metric family more broadly than the implementation
  supports.

For solver-backed studies, report enough of the forward numerical problem to
interpret the inverse or learned result:

- solver and version when relevant;
- domain, grid or mesh, and boundary conditions;
- time discretization and internal step if it differs from stored output;
- tolerances or convergence criteria;
- distinction between the full simulated state and the observations supplied
  to the method.

## Figure discipline

Figures must be locally understandable and support the surrounding argument.

- Introduce each figure in prose before it appears.
- State the horizontal and vertical axes, units, panels, colors or markers,
  aggregation rule, and important filtering.
- Make captions describe both the visual structure and the scientific reading.
- For architecture or workflow figures, state the input and output contract.
- Do not assume the reader remembers a filter or matrix definition from an
  earlier figure.
- Place the figure near its first substantial discussion.
- Follow the journal template's float policy. Use forced placement only when
  necessary and only after checking the rendered page.
- Size for legibility, not maximal occupancy. Avoid oversized figures that
  strand text or create large white gaps.
- Inspect the rendered PDF for clipping, overlap, unreadable labels, float
  order, and page balance.

## Claims checklist

Before finalizing, verify these questions:

- Does the abstract promise only what the results section shows?
- Does the discussion distinguish stable trends from benchmark-specific behavior?
- Are limitations visible, not buried?
- Is the relation to prior work explicit and defensible?
- If a phrase sounds stronger than the table/figure evidence, weaken the phrase.
- Does the manuscript separate architectural conclusions from loss-function conclusions?
- Does the paper say when the method fails or when its assumptions stop being credible?

## Claim sequencing and standalone framing

Write for readers who have not seen the internal experiment history.

- State the supported finding before discussing its boundary.
- Explain why the tested setting is scientifically meaningful.
- State the limitation once, precisely, after the result is clear.
- Do not lead an abstract or result paragraph with repeated defensive
  constructions such as `we do not claim` or `the result is only`.
- Do not hide limitations. Sequencing is not permission to bury them.
- If a comparison is not protocol-matched, report each result accurately and
  discuss comparability without presenting a direct contest.
- Avoid ending the main result with a future-work sentence that makes the
  present study sound unfinished.
- Keep result sections readable as a complete argument rather than a response
  to an unseen earlier draft.

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
