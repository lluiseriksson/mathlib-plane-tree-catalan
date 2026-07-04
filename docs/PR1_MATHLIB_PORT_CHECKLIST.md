# PR 1 Mathlib port checklist

This is the narrow, mechanical checklist for opening PR 1 in `mathlib4`.
It does not change the mathematical surface; it records the exact files,
commands, and acceptance checks for consuming this kit.

## Source file

Copy this repository file:

```text
Mathlib/Combinatorics/Enumerative/PlaneTree.lean
```

to the same path in a fresh `mathlib4` branch.

## Expected imports

The file currently imports only:

```lean
import Mathlib.Combinatorics.Enumerative.Catalan
import Mathlib.Data.Fintype.BigOperators
```

After copying, run `lake exe mk_all` so `Mathlib.lean` imports the new module.

## Public surface to preserve

Definitions:

- `PlaneTree`
- `PlaneTree.children`
- `PlaneTree.numNodes`
- `PlaneTree.forestNumNodes`
- `PlaneTree.forestToBin`
- `PlaneTree.binToForest`
- `PlaneTree.forestEquivBinTree`
- `PlaneTree.planeTreeEquivForest`
- `PlaneTree.planeTreeEquivBinTree`
- `PlaneTree.forestsOfNumNodesEq`
- `PlaneTree.treesOfNumNodesEq`

Main results:

- `PlaneTree.mem_forestsOfNumNodesEq`
- `PlaneTree.card_forestsOfNumNodesEq`
- `PlaneTree.mem_treesOfNumNodesEq`
- `PlaneTree.treesOfNumNodesEq_zero`
- `PlaneTree.card_treesOfNumNodesEq_succ`

## Verification commands

Run these from the `mathlib4` checkout after copying the file and regenerating
imports:

```sh
lake exe mk_all
lake env lean Mathlib/Combinatorics/Enumerative/PlaneTree.lean
./scripts/lint-style.sh Mathlib/Combinatorics/Enumerative/PlaneTree.lean
```

The local oracle recorded in this kit also checks:

```text
PlaneTree.card_treesOfNumNodesEq_succ
PlaneTree.mem_treesOfNumNodesEq
PlaneTree.card_forestsOfNumNodesEq
```

Expected axiom oracle for those declarations:

```text
[propext, Classical.choice, Quot.sound]
```

## Acceptance criteria

- no `sorry`, `axiom`, or `admit` in the copied Lean file
- no Lean `error:` or `warning:` from the module replay
- no `sorryAx` marker in replay logs
- PR body based on `docs/PR1_DESCRIPTION.md`
- topic label suggestion: `t-combinatorics`
