module

public import Erdos627

/-!
# Proved Tutte–Zykov variant

Iteration of the Mycielski construction from K₂ proves the exact statement
recorded independently in Challenge.lean. This module does not import Challenge.
-/

public section

open SimpleGraph

namespace Erdos627

/-- Every integer k ≥ 2 is the chromatic number of a finite graph with clique number two. -/
theorem erdos_627.variants.tutte_zykov :
    ∀ k : ℕ, 2 ≤ k → ∃ (n : ℕ) (G : SimpleGraph (Fin n)),
      G.cliqueNum = 2 ∧ G.chromaticNumber = (k : ℕ∞) := by
  exact exists_cliqueNum_eq_two_chromaticNumber_eq

end Erdos627
