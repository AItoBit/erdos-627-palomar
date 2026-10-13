module

public import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex

/-!
# Triangle-free graphs with prescribed chromatic number

For every integer k ≥ 2 there is a finite simple graph with clique number
exactly two and chromatic number exactly k. This is the Tutte–Zykov variant
listed under [Erdős problem 627](https://www.erdosproblems.com/627).
The proof uses J. Mycielski, *Sur le coloriage des graphs*, Colloquium
Mathematicum 3 (1955), 161–162, doi:10.4064/cm-3-2-161-162.

The bound k ≥ 2 excludes impossible cases: clique number two requires an edge.
The vertex count may depend on k. Both invariants are Mathlib's standard ones;
the finite graph's chromatic number is expressed in extended naturals.
This statement does not assert the limit-existence conjecture in problem 627.
The deliberate Challenge placeholder is checked against the proved Solution.
-/

public section

open SimpleGraph

namespace Erdos627

/-- Every integer k ≥ 2 is the chromatic number of a finite graph with clique number two. -/
theorem erdos_627.variants.tutte_zykov :
    ∀ k : ℕ, 2 ≤ k → ∃ (n : ℕ) (G : SimpleGraph (Fin n)),
      G.cliqueNum = 2 ∧ G.chromaticNumber = (k : ℕ∞) := by
  sorry

end Erdos627
