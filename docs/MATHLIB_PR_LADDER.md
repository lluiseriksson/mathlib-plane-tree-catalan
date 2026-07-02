# Mathlib contribution ladder (idea 2, executed like idea 1)

Playbook: unconditional GitHub first (done: PR #5 + pinned replay), paper
(done), then Mathlib — each PR small, self-contained, green before opening.

## PR 1 — Plane trees counted by Catalan  [READY]
File in this kit: `Mathlib/Combinatorics/Enumerative/PlaneTree.lean`.
Compiled against the pinned snapshot (= current master toolchain), oracle
`[propext, Classical.choice, Quot.sound]`. See `PR1_DESCRIPTION.md`.

## PR 2 — Labeled plane trees: structural kit
Generic `LTree α` (labels in `α`): `labels`, `childrenOf`/`childrenOfForest`,
and, under `labels.Nodup`: existence, uniqueness and antisymmetry of the
structural parent, `nodup_childrenOf`, root-reachability, and the
reconstruction lemma. Source material: the `ChildrenOfKit` section of
`RootedCatalanBridge.lean` (repo), made generic and Mathlib-styled.
Proposed location: `Mathlib/Combinatorics/LabeledPlaneTree.lean` (name open).

## PR 3 — Counting labeled plane trees
Decoration rigidity and `|labeledTreesOn n| = n! * catalan n`.
Source: `LabeledPlaneTreeCatalan.lean`. Depends on PRs 1–2.

## PR 4a — Rooted spanning-tree API for SimpleGraph  [DESIGN INPUT NEEDED]
Mathlib has `SimpleGraph.IsTree` but no finset of spanning trees, no parent
map, no child fibers. Ask on Zulip (post in this kit) whether maintainers
prefer: parent via the unique path to a root, via `SimpleGraph.dist`, or a
bundled `RootedTree` structure. This PR is where the repo definitions
(`spanningTrees`, `bfsParent`, `rootedChildren`) get their Mathlib spelling.

## PR 4b — The identity
`∑_T ∏_v (childCount)! = n! * catalan n` over the PR-4a API, porting the
bijection from `RootedCatalanBridge.lean`. Cite the paper in the docstring.

## Process notes
- Toolchain friction is minimal: our pin v4.29.0-rc6 *is* the current master
  toolchain (verified against mathlib4 master `lean-toolchain`).
- Every module must be reachable from `Mathlib.lean` (`lake exe mk_all`).
- Style: ≤100 columns, docstrings on every `def`/major `theorem`, no
  `#print axioms` in the file itself (CI has its own checks).
- Authorship: copyright header "Lluis Eriksson" (already in the file); each
  PR links repo + paper — that is the "permanently cited infrastructure"
  effect of idea 2.
