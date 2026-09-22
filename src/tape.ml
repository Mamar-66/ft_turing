open Types

let init (input : string) (blank : char) : tape =
  if String.length input = 0 then
    { left = []; current = blank; right = []; blank }
  else
    let chars = List.init (String.length input) (String.get input) in
    {
      left = [];
      current = List.hd chars;
      right = List.tl chars;
      blank;
    }

let move_left (t : tape) : tape =
  match t.left with
  | [] ->
      { left = []; current = t.blank; right = t.current :: t.right; blank = t.blank }
  | hd :: tl ->
      { left = tl; current = hd; right = t.current :: t.right; blank = t.blank }

let move_right (t : tape) : tape =
  match t.right with
  | [] ->
      { left = t.current :: t.left; current = t.blank; right = []; blank = t.blank }
  | hd :: tl ->
      { left = t.current :: t.left; current = hd; right = tl; blank = t.blank }

let write (t : tape) (c : char) : tape =
  { t with current = c }