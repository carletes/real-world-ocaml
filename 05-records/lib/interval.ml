type t = { left : float; right : float }

(** Creates a real interval of the form `[a, b)`, where `a <= b`. *)
let create left right = if left <= right then Some { left; right } else None

(** Returns true if intervals `a` and `b` overlap. *)
let overlap a b = a.right >= b.left

(** Returns true if interval `a` contains interval `b`. *)
let contains a b = a.left <= b.left && a.right >= b.right
