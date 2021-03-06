Set Warnings "-extraction-opaque-accessed,-extraction".
From Coq Require Import List PeanoNat.
From QuickChick Require Import QuickChick.
Import ListNotations QcNotation.

(* Instance noshrink_nat : Shrink nat := *)
(*   {| shrink _ := [] |}. *)

(* Instance noshrink_list : Shrink (list nat) := *)
(*   {| shrink _ := [] |}. *)

(** [remove x l] removes all [x]s from [l]. *)
Fixpoint remove (x : nat) (l : list nat) : list nat :=
  match l with
  | [] => []
  | h::t =>
    if h =? x
    then t
    else h :: remove x t
  end.

(** Formal, partial specification: *)
Definition remove_not_In :=
  forall (x : nat) (l : list nat),
    ~ (In x (remove x l)).

Conjecture removeP : remove_not_In.

QuickCheck removeP.

(* Theorem proof_remove_not_In : remove_not_In. *)
(* Proof with simpl; auto. *)
(*   intros x l. *)
(*   generalize dependent x. *)
(*   induction l... *)
(*   intros x. *)
(*   destruct (a =? x) eqn:Heq... *)
(*   intros []. *)
(*   - subst. *)
(*     rewrite Nat.eqb_refl in Heq. *)
(*     discriminate Heq. *)
(*   - apply IHl in H... *)
(* Qed. *)

Definition eq_symmetry' (x y : nat) : Checker :=
  (x =? y) ==> (y =? x).

QuickCheck eq_symmetry'.

Definition eq_symmetry (x y : nat) : bool :=
  (x = y -> y = x)?.

QuickCheck eq_symmetry.
