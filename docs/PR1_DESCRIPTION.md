# PR title

feat(Combinatorics/Enumerative): plane trees are counted by the Catalan numbers

# PR description (paste below the title)

This PR adds plane trees (rose trees) and proves that the plane trees with
`n + 1` nodes are counted by `catalan n`, by transporting the existing binary
tree enumeration `Tree.treesOfNumNodesEq` across the classical
left-child/right-sibling equivalence `List PlaneTree ≃ Tree Unit`.

New file: `Mathlib/Combinatorics/Enumerative/PlaneTree.lean`.

Main declarations:

- `PlaneTree` — the type of plane trees;
- `PlaneTree.numNodes`, `PlaneTree.forestNumNodes` — node counts;
- `PlaneTree.forestEquivBinTree : List PlaneTree ≃ Tree Unit` — the LCRS
  equivalence, with `numNodes_forestToBin` relating node counts;
- `PlaneTree.forestsOfNumNodesEq`, `PlaneTree.treesOfNumNodesEq` — finsets of
  forests/trees with a given number of nodes, with `simp` membership lemmas;
- `PlaneTree.card_forestsOfNumNodesEq : (forestsOfNumNodesEq n).card = catalan n`;
- `PlaneTree.card_treesOfNumNodesEq_succ : (treesOfNumNodesEq (n + 1)).card = catalan n`.

Motivation: plane trees are the standard "Catalan object" missing from the
`Enumerative` folder, and this is the first step of a short series
culminating in a machine-verified identity over spanning trees of the
complete graph, `∑_T ∏_v (child count)! = n! * catalan n` (see the Zulip
thread and the paper in
https://github.com/lluiseriksson/rooted-tree-catalan-closure for context).

Naming mirrors `Tree.treesOfNumNodesEq`; happy to rename per review.

---

- [ ] depends on: (none)

# Checklist before opening (Mathlib process)

1. Ask for push access in Zulip #new members (PRs are opened from branches of
   mathlib4, not forks). Branch name suggestion: `LE/plane-tree-catalan`.
2. Copy the file into `Mathlib/Combinatorics/Enumerative/PlaneTree.lean` on a
   branch of current `master`.
3. Run `lake exe mk_all` so the module is imported from `Mathlib.lean`
   (required by CI).
4. `lake env lean Mathlib/Combinatorics/Enumerative/PlaneTree.lean` and the
   style linter (`./scripts/lint-style.sh` or let CI run it).
5. Open the PR with the title/description above; add topic label
   `t-combinatorics`.
