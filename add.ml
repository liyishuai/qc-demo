open Unix;;

let add x y =
  let (ic, oc) = open_process "./Add" in
  output_string oc (string_of_int x ^ " " ^ string_of_int y);
  close_out oc;
  let str = input_line ic in
  close_process (ic, oc);
  int_of_string str
