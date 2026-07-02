/-
Copyright (c) 2026 Lluis Eriksson. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Lluis Eriksson
-/
import Mathlib.Combinatorics.Enumerative.Catalan
import Mathlib.Data.Fintype.BigOperators

/-!
# Plane trees and the Catalan numbers

A *plane tree* (also called a rose tree or ordered tree) is a root node
together with a finite *ordered* list of plane subtrees.  This file defines
plane trees and proves that the plane trees with `n + 1` nodes are counted by
the `n`-th Catalan number, by transporting Mathlib's enumeration of binary
trees (`Tree.treesOfNumNodesEq`) across the classical left-child/right-sibling
correspondence between forests of plane trees and binary trees.

## Main definitions

* `PlaneTree`: the type of plane trees.
* `PlaneTree.numNodes`, `PlaneTree.forestNumNodes`: node counts for trees and
  for forests.
* `PlaneTree.forestEquivBinTree : List PlaneTree ≃ Tree Unit`: the
  left-child/right-sibling equivalence.
* `PlaneTree.forestsOfNumNodesEq n`: the finset of forests with `n` nodes in
  total.
* `PlaneTree.treesOfNumNodesEq n`: the finset of plane trees with `n` nodes.

## Main results

* `PlaneTree.card_forestsOfNumNodesEq`: there are `catalan n` plane forests
  with `n` nodes.
* `PlaneTree.card_treesOfNumNodesEq_succ`: there are `catalan n` plane trees
  with `n + 1` nodes.

## References

* [R. P. Stanley, *Catalan Numbers*][stanley2015]
-/

open Nat Finset

/-- A plane tree (shape only): a root node carrying a finite *ordered* list of
plane subtrees.  Plane trees with `n + 1` nodes are counted by `catalan n`. -/
inductive PlaneTree : Type where
  | node : List PlaneTree → PlaneTree

instance : Inhabited PlaneTree :=
  ⟨.node []⟩

namespace PlaneTree

/-- The subtrees of the root. -/
def children : PlaneTree → List PlaneTree
  | node cs => cs

@[simp]
theorem children_node (cs : List PlaneTree) : children (node cs) = cs := rfl

@[simp]
theorem node_children : ∀ t : PlaneTree, node t.children = t
  | node _ => rfl

theorem node_injective : Function.Injective node := by
  intro a b h
  injection h

mutual
  /-- The number of nodes of a plane tree. -/
  def numNodes : PlaneTree → ℕ
    | node cs => forestNumNodes cs + 1
  /-- The total number of nodes of a plane forest. -/
  def forestNumNodes : List PlaneTree → ℕ
    | [] => 0
    | t :: ts => numNodes t + forestNumNodes ts
end

@[simp]
theorem numNodes_node (cs : List PlaneTree) :
    numNodes (node cs) = forestNumNodes cs + 1 := by
  simp [numNodes]

@[simp]
theorem forestNumNodes_nil : forestNumNodes ([] : List PlaneTree) = 0 := by
  simp [forestNumNodes]

@[simp]
theorem forestNumNodes_cons (t : PlaneTree) (ts : List PlaneTree) :
    forestNumNodes (t :: ts) = numNodes t + forestNumNodes ts := by
  simp [forestNumNodes]

theorem one_le_numNodes : ∀ t : PlaneTree, 1 ≤ t.numNodes
  | node cs => by
      rw [numNodes_node]
      omega

/-! ### The left-child/right-sibling correspondence -/

/-- Left-child/right-sibling: from plane forests to binary trees.  The first
tree of the forest provides the root; its forest of children becomes the left
child and the remaining forest (its siblings) becomes the right child. -/
def forestToBin : List PlaneTree → Tree Unit
  | [] => .nil
  | node cs :: ts => .node () (forestToBin cs) (forestToBin ts)

/-- Inverse of the left-child/right-sibling map: from binary trees to plane
forests. -/
def binToForest : Tree Unit → List PlaneTree
  | .nil => []
  | .node _ l r => node (binToForest l) :: binToForest r

theorem binToForest_forestToBin :
    ∀ f : List PlaneTree, binToForest (forestToBin f) = f
  | [] => by simp [forestToBin, binToForest]
  | node cs :: ts => by
      simp only [forestToBin, binToForest]
      rw [binToForest_forestToBin cs, binToForest_forestToBin ts]

theorem forestToBin_binToForest :
    ∀ t : Tree Unit, forestToBin (binToForest t) = t
  | .nil => by simp [binToForest, forestToBin]
  | .node () l r => by
      simp only [binToForest, forestToBin]
      rw [forestToBin_binToForest l, forestToBin_binToForest r]

/-- **The left-child/right-sibling equivalence**: plane forests are
equivalent to binary trees. -/
def forestEquivBinTree : List PlaneTree ≃ Tree Unit where
  toFun := forestToBin
  invFun := binToForest
  left_inv := binToForest_forestToBin
  right_inv := forestToBin_binToForest

/-- A plane tree is exactly its forest of children. -/
def planeTreeEquivForest : PlaneTree ≃ List PlaneTree where
  toFun := children
  invFun := node
  left_inv := node_children
  right_inv := fun _ => rfl

/-- Plane trees are equivalent to binary trees. -/
def planeTreeEquivBinTree : PlaneTree ≃ Tree Unit :=
  planeTreeEquivForest.trans forestEquivBinTree

/-- The left-child/right-sibling map turns total node count of the forest
into node count of the binary tree. -/
theorem numNodes_forestToBin :
    ∀ f : List PlaneTree, (forestToBin f).numNodes = forestNumNodes f
  | [] => by simp [forestToBin, Tree.numNodes]
  | node cs :: ts => by
      simp only [forestToBin, Tree.numNodes, forestNumNodes_cons,
        numNodes_node]
      rw [numNodes_forestToBin cs, numNodes_forestToBin ts]
      omega

theorem forestNumNodes_binToForest (t : Tree Unit) :
    forestNumNodes (binToForest t) = t.numNodes := by
  conv_rhs => rw [← forestToBin_binToForest t]
  exact (numNodes_forestToBin _).symm

/-! ### Counting: transporting `Tree.treesOfNumNodesEq` -/

/-- The plane forests with exactly `n` nodes in total, as a finset. -/
def forestsOfNumNodesEq (n : ℕ) : Finset (List PlaneTree) :=
  (Tree.treesOfNumNodesEq n).map
    ⟨binToForest, Function.LeftInverse.injective forestToBin_binToForest⟩

@[simp]
theorem mem_forestsOfNumNodesEq {n : ℕ} {f : List PlaneTree} :
    f ∈ forestsOfNumNodesEq n ↔ forestNumNodes f = n := by
  simp only [forestsOfNumNodesEq, Finset.mem_map, Function.Embedding.coeFn_mk,
    Tree.mem_treesOfNumNodesEq]
  constructor
  · rintro ⟨t, hn, rfl⟩
    rw [forestNumNodes_binToForest]
    exact hn
  · intro h
    exact ⟨forestToBin f, by rw [numNodes_forestToBin]; exact h,
      binToForest_forestToBin f⟩

theorem card_forestsOfNumNodesEq (n : ℕ) :
    (forestsOfNumNodesEq n).card = catalan n := by
  rw [forestsOfNumNodesEq, Finset.card_map,
    Tree.treesOfNumNodesEq_card_eq_catalan]

/-- The plane trees with exactly `n` nodes, as a finset. -/
def treesOfNumNodesEq : ℕ → Finset PlaneTree
  | 0 => ∅
  | n + 1 => (forestsOfNumNodesEq n).map ⟨node, node_injective⟩

@[simp]
theorem mem_treesOfNumNodesEq : ∀ {n : ℕ} {t : PlaneTree},
    t ∈ treesOfNumNodesEq n ↔ t.numNodes = n
  | 0, t => by
      have h1 := one_le_numNodes t
      constructor
      · intro h
        simp [treesOfNumNodesEq] at h
      · intro h
        exact absurd h1 (by omega)
  | n + 1, t => by
      simp only [treesOfNumNodesEq, Finset.mem_map,
        Function.Embedding.coeFn_mk, mem_forestsOfNumNodesEq]
      constructor
      · rintro ⟨f, hf, rfl⟩
        rw [numNodes_node, hf]
      · intro h
        obtain ⟨cs⟩ := t
        rw [numNodes_node] at h
        exact ⟨cs, by omega, rfl⟩

@[simp]
theorem treesOfNumNodesEq_zero : treesOfNumNodesEq 0 = ∅ := rfl

/-- **There are `catalan n` plane trees with `n + 1` nodes.** -/
theorem card_treesOfNumNodesEq_succ (n : ℕ) :
    (treesOfNumNodesEq (n + 1)).card = catalan n := by
  simp only [treesOfNumNodesEq]
  rw [Finset.card_map, card_forestsOfNumNodesEq]

end PlaneTree
