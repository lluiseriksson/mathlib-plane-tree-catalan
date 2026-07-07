# Status digest

Last checked: 2026-07-07 02:46 UTC.

Repository HEAD:

- Branch: `main`
- Commit: `abde04f5607f0b332d30cd93bb903bd3e63d6754`
- PR #1 status: merged into `main` as
  `24aa3bb0669b6b2c139fd394fa2b0dd3dbefa401`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/1>)
- PR #2 status: merged into `main` as
  `35fe1b467436696e590a8344ed8c77b94f7432ad`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/2>)
- PR #3 status: merged into `main` as
  `39dd223cfad0c2d0d12f6d116f8119cefcc9c249`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/3>)
- PR #4 status: merged into `main` as
  `94c231a640004527df043dc7137af2fa0761d6b0`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/4>)
- PR #5 status: merged into `main` as
  `ab111a092fa59d98552cc4092e1ec4e19cdad5ba`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/5>)
- PR #6 status: merged into `main` as
  `06dcf83ca3351db9f98d21aa6f9277ed261b8529`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/6>)
- PR #7 status: merged into `main` as
  `389a24f83f785b75eba511c127fa7059ac90da83`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/7>)
- PR #8 status: merged into `main` as
  `653969081e316ca52379800515d418001d844274`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/8>)
- PR #9 status: merged into `main` as
  `6366ac8f98a9cc5cf2c69939c269efde03f0c20a`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/9>)
- PR #11 status: merged into `main` as
  `abde04f5607f0b332d30cd93bb903bd3e63d6754`
  (<https://github.com/lluiseriksson/mathlib-plane-tree-catalan/pull/11>)
- Latest default-branch heartbeat: `PR1 Lean replay` passed on
  `abde04f5607f0b332d30cd93bb903bd3e63d6754` at
  <https://github.com/lluiseriksson/mathlib-plane-tree-catalan/actions/runs/28837556753>
- Open PRs: none at the time of this digest.
- Open `agent-task`, `blocked`, or `interface-change` issues: none at the time
  of this digest.
- Local no-placeholder check for the Lean module found no `sorry`, `axiom`, or
  `admit`.
- Local whitespace check for this repository checkout: `git diff --check`
  passed.

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

- Open the first Mathlib PR from `docs/PR1_DESCRIPTION.md` after copying
  `Mathlib/Combinatorics/Enumerative/PlaneTree.lean` into a current Mathlib
  checkout and running `lake exe mk_all`.
- Use `docs/PR1_MATHLIB_PORT_CHECKLIST.md` as the exact port checklist for
  commands, public surface, and replay/oracle acceptance criteria.

Downstream repo handoff:

- This kit should only be consumed as a small Catalan/plane-tree API package.
- It does not provide the later labeled-tree API, spanning-tree finset API, or
  rooted child-count API.
- The next design dependency remains PR-4a from `docs/MATHLIB_PR_LADDER.md`:
  ask maintainers where a rooted spanning-tree parent/children API should live.
