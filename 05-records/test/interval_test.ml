open Base

let%test _ = Option.is_some (Interval.create 0. 1.)
let%test _ = Option.is_some (Interval.create 0. 0.)
let%test _ = Option.is_none (Interval.create 1. 0.)

let%test _ =
  let a = Option.value_exn (Interval.create 0. 3.)
  and b = Option.value_exn (Interval.create 1. 2.) in
  Interval.contains a b

let%test _ =
  let a = Option.value_exn (Interval.create 0. 3.)
  and b = Option.value_exn (Interval.create 1. 4.) in
  not (Interval.contains a b)

let%test _ =
  let a = Option.value_exn (Interval.create 0. 1.)
  and b = Option.value_exn (Interval.create 4. 5.) in
  not (Interval.contains a b)

let%test _ =
  let a = Option.value_exn (Interval.create 0. 3.)
  and b = Option.value_exn (Interval.create 1. 2.) in
  Interval.overlap a b

let%test _ =
  let a = Option.value_exn (Interval.create 0. 3.)
  and b = Option.value_exn (Interval.create 1. 4.) in
  Interval.overlap a b

let%test _ =
  let a = Option.value_exn (Interval.create 0. 1.)
  and b = Option.value_exn (Interval.create 4. 5.) in
  not (Interval.overlap a b)
