# Definition fidelity: the two graph invariants

The theorem `Erdos627.erdos_627.variants.tutte_zykov` uses exactly two Mathlib
invariants, `SimpleGraph.cliqueNum` and `SimpleGraph.chromaticNumber`. This
repository defines neither. Both come from the Mathlib revision pinned in
`lakefile.toml` and `lake-manifest.json`:

    065356127b1dc0016f66b7283ce0ce2c4055aa55

To let a reviewer check the definitions without building, the two source files
that contain them are included verbatim (Apache-2.0, headers intact), fetched
from that exact revision:

- `reference/mathlib-065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Combinatorics/SimpleGraph/Clique.lean.txt`
- `reference/mathlib-065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean.txt`

They carry a `.txt` suffix so they are never compiled or imported. Upstream
permalinks:

- https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Combinatorics/SimpleGraph/Clique.lean
- https://github.com/leanprover-community/mathlib4/blob/065356127b1dc0016f66b7283ce0ce2c4055aa55/Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean

## `SimpleGraph.cliqueNum` (Clique.lean, line 726)

```lean
/-- The maximum number of vertices in a clique of a graph `G`. -/
noncomputable def cliqueNum (G : SimpleGraph α) : ℕ := sSup {n | ∃ s, G.IsNClique n s}
```

with `IsNClique n s` (line 246) meaning `G.IsClique s ∧ #s = n`.

- It is a supremum over ℕ of the sizes of cliques. For a finite vertex type the
  set is bounded (`cliqueNum_le_natCard`), so the value is the true maximum
  clique size. The theorem's graphs live on `Fin n`, so they are finite.
- Empty vertex type: `cliqueNum_of_isEmpty` gives `0` (line 754).
- Nonempty finite vertex type: `cliqueNum_ne_zero_of_finite` gives `≠ 0`
  (line 743); the edgeless graph has `cliqueNum = 1` (`cliqueNum_bot`, line 783);
  the complete graph has `cliqueNum = Nat.card α` (`cliqueNum_top`, line 769).
- Hence `cliqueNum = 2` for a graph on `Fin n` means there is a clique of two
  adjacent vertices and no clique of three, i.e. the graph is triangle-free with
  at least one edge. No degenerate case (n = 0, edgeless, junk value from an
  unbounded supremum) can satisfy `cliqueNum = 2`.

## `SimpleGraph.chromaticNumber` (Coloring/Vertex.lean, line 212)

```lean
def Colorable (n : ℕ) : Prop := Nonempty (G.Coloring (Fin n))      -- line 163

noncomputable def chromaticNumber : ℕ∞ := ⨅ n ∈ Set.ofPred G.Colorable, (n : ℕ∞)
```

- It is the infimum, in ℕ∞, of the `n` for which a proper coloring with colors
  `Fin n` exists; the docstring states it is `⊤` exactly when no finite
  coloring exists.
- Empty vertex type: `chromaticNumber_eq_zero_iff` (line 496) says the value is
  `0` iff the vertex type is empty. For `k ≥ 2` the equality
  `chromaticNumber = (k : ℕ∞)` therefore excludes the empty graph.
- A finite graph is colorable with as many colors as it has vertices (using
  `selfColoring`, line 205, as the coloring with the vertices themselves as
  colors), so the value is a natural number cast to ℕ∞, never `⊤`.
- Complete graph: `chromaticNumber_top` (line 447) gives the vertex count, so
  `K₂` has chromatic number 2, consistent with the `k = 2` base case.

## Why the two invariants combine non-vacuously

For `k ≥ 2` the statement asks for a finite nonempty graph with a clique of
size exactly 2 (so an edge) and no 3-clique, whose chromatic number is exactly
`k`. The `k ≥ 2` hypothesis is necessary: an edge forces chromatic number ≥ 2.
