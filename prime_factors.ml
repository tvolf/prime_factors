(* decomposition of input number to prime factors *)

open Big_int

let _ = ( 
    Printf.printf "Enter positive integer number : %!";
	let input_int = try 
					Some (big_int_of_string (input_line stdin)) 
				  with 
					Failure "invalid digit" -> None in
	match input_int with 
		| Some input_i when compare_big_int input_i zero_big_int = 1 ->	
			 Printf.printf "%s entered" (string_of_big_int input_i)
		| None | Some _ -> 
		     print_endline "Enter positive integer number, please..."
)
;;
