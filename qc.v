Set Warnings "-extraction-opaque-accessed,-extraction".
From Coq Require Import List PeanoNat.
From QuickChick Require Import QuickChick.
Import ListNotations QcNotation.

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

(*! QuickChick removeP. *)

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

Declare ML Module "add".
Parameter add' : nat -> nat -> nat.
Extract Constant add' => "Add.add".

(** Formal, full specification:
    [add'] behaves the same as [+].
 *)
Conjecture add_prop :
  forall (x y : nat),
    add' x y = x + y.

(*! QuickChick add_prop. *)
