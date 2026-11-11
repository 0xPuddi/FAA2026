/-
Copyright (c) 2026 Sorrachai Yingchareonthawornchai. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Basil Rohner
-/
import Mathlib
import Cslib.Algorithms.Lean.TimeM

import Cslib.Computability.Machines.Turing.MultiTape.Space


open Cslib.Algorithms.Lean

set_option autoImplicit false



/-!
# Homework 8

-/


namespace HW8

/-- An undirected graph without self-loops on the vertices `Fin n = {0, ..., n - 1}`,
given by its adjacency lists: `v ∈ G.adj u` means that `u` and `v` are adjacent. -/
structure Graph (n : ℕ) where
  /-- The adjacency list of every vertex. -/
  adj : Fin n → List (Fin n)
  /-- Edges are undirected. -/
  symm : ∀ u v, v ∈ adj u → u ∈ adj v
  /-- There are no self-loops. -/
  loopless : ∀ v, v ∉ adj v

example
    {k : ℕ}
    {State Symbol : Type}
    {input : List Symbol}
    {ntm : MultiTapeNTM k Symbol State}
    {p : ntm.RunPath input}
    {s : ℕ}
    (h : p.InWindow s) :
    p.space ≤ k * (2 * s + 1) := by
  exact h.space_le

end HW8
