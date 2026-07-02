# Zulip post v3 — channel: #maths
# Topic: Catalan identity over spanning trees, formalized

Hi everyone — first post here.

I recently proved in Lean the following identity, which had been sitting as
an explicitly open, named proposition in a public repository of mine (kept
as a hypothesis, so that downstream theorems stayed honest about assuming
it):

```lean
∑ T ∈ spanningTrees (⊤ : SimpleGraph (Fin (n + 1))), ∏ v, (rootedChildCount T v)! = n ! * catalan n
```

— the sum is over all spanning trees of the complete graph on {0,…,n},
rooted at 0, and `rootedChildCount T v` is the number of children of `v`.
The identity is the exact "second-Ursell" normalization constant in a
cluster-expansion programme, but it is pure enumerative combinatorics.

**It now holds unconditionally for every `n`**, via an explicit bijection
between pairs (spanning tree, linear ordering of every child set) and
vertex-labeled plane trees with root label 0. The formalization is ~2,200
lines over Mathlib (`leanprover/lean4:v4.29.0-rc6`, the current master
toolchain), no `sorry`, axiom oracle exactly
`[propext, Classical.choice, Quot.sound]`, with a pinned CI replay:

- Repository + closing PR: https://github.com/lluiseriksson/rooted-tree-catalan-closure/pull/5
- Pinned CI replay: https://github.com/lluiseriksson/rooted-tree-catalan-closure/actions/runs/28613639650
- Write-up (bijection + formalization notes): `paper/paper.pdf` in the repository

**Mathlib proposal.** The reusable parts don't exist in Mathlib yet, and I'd
like to contribute them as a short ladder of small PRs:

1. **Plane trees counted by Catalan** (draft ready and compiling on the
   master toolchain): `PlaneTree` (rose trees), the left-child/right-sibling
   equivalence `List PlaneTree ≃ Tree Unit`, and
   `card_treesOfNumNodesEq_succ : (treesOfNumNodesEq (n+1)).card = catalan n`,
   transported from `Tree.treesOfNumNodesEq`. Proposed location:
   `Mathlib/Combinatorics/Enumerative/PlaneTree.lean`.
2. **Labeled plane trees**: labels, `childrenOf`, existence/uniqueness/
   antisymmetry of structural parents, and a reconstruction lemma
   (generic `α`).
3. **Counting labeled plane trees**: root-0 labelings of a shape are `n!`,
   hence `n! * catalan n` labeled plane trees.
4. **The spanning-tree identity.** Here I'd genuinely like design input:
   Mathlib has `SimpleGraph.IsTree` but no finset of spanning trees and no
   rooted-children API. Would a rooted-spanning-tree API (parent along the
   unique path to a root, child fibers) be welcome, and where should it live?

Naming in the draft mirrors `Tree.treesOfNumNodesEq`; happy to bikeshed.
If this sounds reasonable I'll ask for push access in #new members and open
PR 1.

Thanks!
Lluis
