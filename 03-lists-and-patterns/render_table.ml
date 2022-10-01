open Base

let table_header = [ "Language"; "Architect"; "First release" ]

let table =
  [
    [ "Lisp"; "John McArthy"; "1958" ];
    [ "C"; "Dennis Ritchie"; "1969" ];
    [ "ML"; "Robin Milner"; "1973" ];
    [ "OCaml"; "Xavier Leroy"; "1996" ];
  ]

let max_widths header rows =
  let lengths ls = List.map ~f:String.length ls in
  List.fold rows ~init:(lengths header) ~f:(fun acc row ->
      List.map2_exn ~f:Int.max acc (lengths row))

let render_separator widths =
  let pieces = List.map ~f:(fun w -> String.make w '-') widths in
  "|-" ^ String.concat ~sep:"-+-" pieces ^ "-|"

let pad s length = s ^ String.make (length - String.length s) ' '

let render_row row widths =
  let padded = List.map2_exn ~f:pad row widths in
  "| " ^ String.concat ~sep:" | " padded ^ " |"

let render_table header rows =
  let widths = max_widths header rows in
  String.concat ~sep:"\n"
    (render_row header widths :: render_separator widths
    :: List.map ~f:(fun row -> render_row row widths) rows)

let () = Stdio.print_endline (render_table table_header table)
