open Base
module Time = Core.Time

module type ID = sig
  type t

  val of_string : string -> t
  val to_string : t -> string
  val ( = ) : t -> t -> bool
end

module String_id = struct
  type t = string

  let of_string x = x
  let to_string x = x
  let ( = ) = String.( = )
end

module Username : ID = String_id
module Hostname : ID = String_id

type session_info = {
  user : Username.t;
  host : Hostname.t;
  when_started : Time.t;
}

let sessions_have_same_user s1 s2 = Username.( = ) s1.user s2.user

let%test "eq" =
  sessions_have_same_user
    {
      user = Username.of_string "carlos";
      host = Hostname.of_string "here";
      when_started = Time.now ();
    }
    {
      user = Username.of_string "carlos";
      host = Hostname.of_string "there";
      when_started = Time.now ();
    }
