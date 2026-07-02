# Zulip post — channel: #maths (crosslink in #new members when asking for push access)

**Subject: A Catalan identity over spanning trees of K_{n+1}, formalized — and a plane-tree PR for Mathlib**

Hi everyone,

a few months ago I opened a small self-contained challenge: prove in Lean that

```
∑ T ∈ spanningTrees (⊤ : SimpleGraph (Fin (n + 1))), ∏ v, (rootedChildCount T v)! = n ! * catalan n
```

(the sum is over all spanning trees of the complete graph on {0,…,n}, rooted
at 0, and `rootedChildCount T v` is the number of children of `v`). The
identity is the exact "second-Ursell" normalization constant in a
cluster-expansion programme, but it is pure enumerative combinatorics.

**The challenge is now closed.** The identity holds unconditionally for every
`n`, proved via an explicit bijection between pairs (spanning tree, linear
ordering of every child set) and vertex-labeled plane trees with root label 0.
The formalization is ~2,200 lines over Mathlib
(`leanprover/lean4:v4.29.0-rc6`, the current master toolchain), no `sorry`,
axiom oracle exactly `[propext, Classical.choice, Quot.sound]`, with a pinned
CI replay:

- Repository + closure PR: https://github.com/lluiseriksson/rooted-tree-catalan-closure/pull/5
- CI replay run: https://github.com/lluiseriksson/rooted-tree-catalan-closure/actions/runs/28610948452
- Paper (bijection + formalization notes): `paper/paper.pdf` in the repository

**Mathlib proposal.** The reusable parts don't exist in Mathlib yet, and I'd
like to contribute them as a short ladder of small PRs:

1. **Plane trees counted by Catalan** (ready): `PlaneTree` (rose trees), the
   left-child/right-sibling equivalence `List PlaneTree ≃ Tree Unit`, and
   `card_treesOfNumNodesEq_succ : (treesOfNumNodesEq (n+1)).card = catalan n`,
   transported from `Tree.treesOfNumNodesEq`. Proposed location:
   `Mathlib/Combinatorics/Enumerative/PlaneTree.lean`.
2. **Labeled plane trees**: labels, `childrenOf`, existence/uniqueness/
   antisymmetry of structural parents, reconstruction (generic `α`).
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
