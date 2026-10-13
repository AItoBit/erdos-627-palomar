# Triangle-free graphs with prescribed chromatic number

For every integer **k ≥ 2**, this project proves that a finite simple graph
exists with **clique number exactly 2** and **chromatic number exactly k**.
This is the classical Tutte–Zykov variant listed under
[Erdős problem 627](https://www.erdosproblems.com/627).
The main question there, about convergence of a normalized extremal
chromatic-to-clique ratio, remains open and is outside this submission.

## Mathematical content

The theorem demonstrates that bounding the size of a clique does not bound
the chromatic number, even among triangle-free graphs. It is a classical
result in graph coloring and extremal graph theory, with a research audience
studying the relation between local clique constraints and global coloring.
We claim a formalization of this established theorem, not a new mathematical
result or priority over other formalizations.

The proof follows Jan Mycielski, *Sur le coloriage des graphs*,
Colloquium Mathematicum **3** (1955), 161–162,
[doi:10.4064/cm-3-2-161-162](https://doi.org/10.4064/cm-3-2-161-162).
It adds shadow vertices and an apex to a graph. Coloring each shadow as its
original vertex gives the upper bound of one extra color. Recoloring original
vertices whose color equals the apex color with their shadows' colors would
remove that color from any purported smaller coloring, proving the lower bound.
The construction preserves triangle-freeness. Its apex–shadow edge gives
clique number two for nonempty input. Iteration from K₂ gives chromatic number
k, and a vertex equivalence transports the graph to `Fin n`.

The bound `k ≥ 2` is necessary because clique number two implies an edge.
The case `k = 2` is K₂. The vertex count depends on k. Mathlib's standard
`SimpleGraph.cliqueNum` and `SimpleGraph.chromaticNumber` are used directly;
the latter takes values in the extended naturals. There are no extra
mathematical assumptions or finite-search restrictions.

## Files and reproducibility

- `Challenge.lean`: the small independently readable statement, importing only
  Mathlib. Its single deliberate `sorry` is a Comparator input, not a proof.
- `Erdos627/Mycielski.lean`: the complete reusable proof development.
- `Solution.lean`: the proved declaration with the same name and type.
- `comparator.json`: the one compared theorem and the standard permitted axioms.
- `formalization.yaml`: sources, authorship, AI use, scope, and review status.
- `Audit.lean`: axiom inspection of the result and principal dependencies.
- `DEFINITIONS.md`: definition-level review of `cliqueNum` and `chromaticNumber`,
  including degenerate cases, with the two pinned Mathlib source files that
  define them under `reference/` (verbatim, uncompiled `.txt` copies).

The project pins Lean `v4.35.0-rc2` and Mathlib commit
`065356127b1dc0016f66b7283ce0ce2c4055aa55`, including its full dependency manifest.
Run:

```sh
lake exe cache get
lake --wfail build Erdos627 Solution
lake build Challenge
lake env lean -DwarningAsError=true Audit.lean
```

The Challenge's expected placeholder warning is excluded from proof-status
counts. The Solution and its proof dependency contain no `sorry`, custom
axioms, or `native_decide`. The permitted foundational axioms are `propext`,
`Classical.choice`, and `Quot.sound`.

The `Palomar preflight` workflow runs the complete, commit-pinned official
Palomar verifier in `mode: full` with `palomar-standard-v1`. Its
`mechanical-report.json` is authoritative for that snapshot; a successful
Lean build alone is not a claim that Palomar verification passed.
Submission uses [Palomar's intake](https://submit.palomar-registry.org/)
and its documented agent protocol. A passing preflight is not registration
or editorial endorsement.

## Provenance and responsibility

The human author and responsible maintainer is **alexander** (GitHub account
`AItoBit`). Codex agents performed the formalization, source research, statement
audit, Lean repair, and packaging at the human's request. A separate AI agent
audited the source development; no human expert review is claimed.

The full proof was developed in the same task as
[Formal Conjectures PR 7259](https://github.com/google-deepmind/formal-conjectures/pull/7259).
Its exact earlier source is
[commit 1a76ea748d65814f4e979d746bb281228f4dbf5e](https://github.com/AItoBit/formal-conjectures/tree/1a76ea748d65814f4e979d746bb281228f4dbf5e).
This repository includes that proof in full and ports it to Palomar's supported
toolchain; it is not a wrapper around an unrecorded proof dependency.
The earlier development compiled with Lean 4.33.1 and its target used only the
three standard axioms. Current-toolchain verification is recorded separately
in this repository's CI.

The repository is licensed under **Apache-2.0**. The original Formal Conjectures
copyright header is retained in the reused proof. Mathematical publications
and external dependencies retain their respective rights and licences.
