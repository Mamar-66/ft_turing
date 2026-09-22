open Types

let () =
  let t0 = Tape.init "111+11=" 'B' in
  Printf.printf "Position 0 : '%c'\n" t0.current;

  let t1 = Tape.move_right t0 in
  Printf.printf "Move right -> Position 1 : '%c'\n" t1.current;

  let t2 = Tape.move_right t1 in
  Printf.printf "Move right -> Position 2 : '%c'\n" t2.current;

  let t3 = Tape.move_right t2 in
  Printf.printf "Move right -> Position 3 : '%c'\n" t3.current;

  let t4 = Tape.write t3 'X' in
  Printf.printf "Write 'X'  -> Position 3 : '%c'\n" t4.current;

  let t5 = Tape.move_left t4 in
  Printf.printf "Move left  -> Position 2 : '%c'\n" t5.current