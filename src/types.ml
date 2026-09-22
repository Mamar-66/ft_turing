type action =
  | Left
  | Right

type transition = {
  read : char;
  to_state : string;
  write : char;
  action : action;
}

type turing_machine = {
  name : string;
  alphabet : char list;
  blank : char;
  states : string list;
  initial : string;
  finals : string list;
  transitions : ((string * char), transition) Hashtbl.t;
}

type tape = {
  left : char list;
  current : char;
  right : char list;
  blank : char;
}