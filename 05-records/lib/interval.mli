type t

(** Creates a real interval of the form `[a, b)`, where `a <= b` *)
val create : float -> float -> t option

(** Returns true if intervals overlap. *)
val overlap : t -> t -> bool

(** Returns true if the first interval contains the second one. *)
val contains : t -> t -> bool
