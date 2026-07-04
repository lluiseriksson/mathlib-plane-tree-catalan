# Status digest

Last checked: 2026-07-04 04:07 UTC.

Repository HEAD:

- Branch: `main`
- Commit: `77adbc66fc7bcaae062fcd6c982fb3f580852775`
- Latest default-branch CI: `PR1 Lean replay` passed at
  <https://github.com/lluiseriksson/mathlib-plane-tree-catalan/actions/runs/28626403573>
- Active satellite PR: #1
  <https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/1>
- PR branch: `codex/hourly-status-digest-20260703-2200`
- Latest PR-branch replay: `PR1 Lean replay` passed on
  `df128f7cd8ae425c982025cc6d7e949d43e370d5` at
  <https://github.com/lluiseriksson/mathlib-plane-tree-catalan/actions/runs/28688733179>
- Open `agent-task`, `blocked`, or `interface-change` issues: none at the time
  of this digest.

## PR-1 consumable surface

Lean file:

- `Mathlib/Combinatorics/Enumerative/PlaneTree.lean`

Definitions intended for the first Mathlib PR:

- `PlaneTree`
- `PlaneTree.children`
- `PlaneTree.numNodes`
- `PlaneTree.forestNumNodes`
- `PlaneTree.forestToBin`
- `PlaneTree.binToForest`
- `PlaneTree.forestEquivBinTree : List PlaneTree ≃ Tree Unit`
- `PlaneTree.planeTreeEquivForest : PlaneTree ≃ List PlaneTree`
- `PlaneTree.planeTreeEquivBinTree : PlaneTree ≃ Tree Unit`
- `PlaneTree.forestsOfNumNodesEq`
- `PlaneTree.treesOfNumNodesEq`

Main lemmas and theorems:

- `PlaneTree.children_node`
- `PlaneTree.node_children`
- `PlaneTree.node_injective`
- `PlaneTree.numNodes_node`
- `PlaneTree.forestNumNodes_nil`
- `PlaneTree.forestNumNodes_cons`
- `PlaneTree.one_le_numNodes`
- `PlaneTree.binToForest_forestToBin`
- `PlaneTree.forestToBin_binToForest`
- `PlaneTree.numNodes_forestToBin`
- `PlaneTree.forestNumNodes_binToForest`
- `PlaneTree.mem_forestsOfNumNodesEq`
- `PlaneTree.card_forestsOfNumNodesEq`
- `PlaneTree.mem_treesOfNumNodesEq`
- `PlaneTree.treesOfNumNodesEq_zero`
- `PlaneTree.card_treesOfNumNodesEq_succ`

## Verification evidence

Pinned replay inputs:

- Lean toolchain: `leanprover/lean4:v4.29.0-rc6`
- Mathlib snapshot: `07642720480157414db592fa85b626dafb71355b`
- Recorded local oracle: `verification/pr1-compile-oracle.log`

Recorded oracle declarations:

- `PlaneTree.card_treesOfNumNodesEq_succ`
- `PlaneTree.mem_treesOfNumNodesEq`
- `PlaneTree.card_forestsOfNumNodesEq`

Allowed oracle output for those declarations:

- `[propext, Classical.choice, Quot.sound]`

The replay workflow also checks that the copied module builds as
`Mathlib.Combinatorics.Enumerative.PlaneTree` and that replay logs contain no
Lean `error:`, `warning:`, or `sorryAx` marker.

## Mother-facing consumption

Immediate consumer:

- Open Mathlib PR 1 from `docs/PR1_DESCRIPTION.md` after copying
  `Mathlib/Combinatorics/Enumerative/PlaneTree.lean` into a current Mathlib
  checkout and running `lake exe mk_all`.

Downstream repo handoff:

- This kit should only be consumed as a small Catalan/plane-tree API package.
- It does not provide the later labeled-tree API, spanning-tree finset API, or
  rooted child-count API.
- The next design dependency remains PR-4a from `docs/MATHLIB_PR_LADDER.md`:
  ask maintainers where a rooted spanning-tree parent/children API should live.
