# mathlib-plane-tree-catalan

This repository packages the first Mathlib-facing extraction from the closed
rooted child-factorial Catalan identity project:

```lean
∑ T ∈ spanningTrees (⊤ : SimpleGraph (Fin (n + 1))),
    ∏ v, (rootedChildCount T v)! = n ! * catalan n
```

The immediate PR candidate is a small, self-contained enumerative-combinatorics
file:

- [`Mathlib/Combinatorics/Enumerative/PlaneTree.lean`](Mathlib/Combinatorics/Enumerative/PlaneTree.lean)

It defines plane trees, the left-child/right-sibling equivalence with binary
trees, and proves that plane trees with `n + 1` nodes are counted by
`catalan n`.

## PR 1 Status

Prepared Mathlib PR:

- Current digest: [`STATUS.md`](STATUS.md)
- Title/description: [`docs/PR1_DESCRIPTION.md`](docs/PR1_DESCRIPTION.md)
- Compile/oracle log: [`verification/pr1-compile-oracle.log`](verification/pr1-compile-oracle.log)
- Proposed Zulip post: [`docs/ZULIP_POST.md`](docs/ZULIP_POST.md)
- Contribution ladder: [`docs/MATHLIB_PR_LADDER.md`](docs/MATHLIB_PR_LADDER.md)

Recorded verification:

```text
lake env lean Mathlib/Combinatorics/Enumerative/PlaneTree.lean
exit: 0 (no errors, no warnings)

PlaneTree.card_treesOfNumNodesEq_succ
PlaneTree.mem_treesOfNumNodesEq
PlaneTree.card_forestsOfNumNodesEq
axioms: [propext, Classical.choice, Quot.sound]
```

Toolchain recorded in the log:

- Lean: `leanprover/lean4:v4.29.0-rc6`
- Mathlib snapshot: `07642720480157414db592fa85b626dafb71355b`

## How To Open PR 1 In Mathlib

1. Ask for push access in Lean Zulip `#new members`.
2. In a current `mathlib4` checkout, create branch `LE/plane-tree-catalan`.
3. Copy this file to:

   ```text
   Mathlib/Combinatorics/Enumerative/PlaneTree.lean
   ```

4. Run:

   ```sh
   lake exe mk_all
   lake env lean Mathlib/Combinatorics/Enumerative/PlaneTree.lean
   ```

5. Open the PR using [`docs/PR1_DESCRIPTION.md`](docs/PR1_DESCRIPTION.md).

## Paper

The accompanying paper is included in [`paper/`](paper/):

- [`paper/paper.tex`](paper/paper.tex)
- [`paper/paper.pdf`](paper/paper.pdf)

Title:

> A Machine-Verified Bijective Proof of the Rooted Child-Factorial Catalan
> Identity over Spanning Trees of the Complete Graph

Preprint: [ai.viXra:2607.0001](https://ai.vixra.org/abs/2607.0001).

The original closure repository and PR are:

- <https://github.com/lluiseriksson/rooted-tree-catalan-closure>
- <https://github.com/lluiseriksson/rooted-tree-catalan-closure/pull/5>

## License

The Lean contribution is prepared for Mathlib and follows the Apache 2.0 header
used in the file. The repository includes the Apache 2.0 license text.
