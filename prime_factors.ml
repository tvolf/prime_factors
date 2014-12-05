(* decomposition of input number to prime factors *)

open Big_int


let rec calc_one_prime n m =
	 let rem = mod_big_int n m in 
	 if compare_big_int rem zero_big_int = 0 then m 
	 else calc_one_prime n (succ_big_int m)
;;   

let rec calc_primes n = 
  if compare_big_int n unit_big_int = 0 then [unit_big_int] 
  else  
     let new_prime = calc_one_prime n (big_int_of_int 2) in
     new_prime :: calc_primes ( div_big_int n new_prime )
;;	
	
  
let rec print_list = function 
     [] -> ()
     | e::l -> print_string (string_of_big_int e) ; print_string " " ; print_list l   
;;	 

let _ = ( 
    Printf.printf "Enter positive integer number : %!";
	let input_int = try 
					 Some (big_int_of_string (input_line stdin)) 
				  with 
					| Failure "invalid digit" -> None 
					| Failure "sys_big_int_of_string" -> None 					
				  in
					
	match input_int with 
		| Some input_i when compare_big_int input_i zero_big_int = 1 ->	
				let result = calc_primes input_i in print_list result 
		| None | Some _ -> 
				print_endline "Enter positive integer number, please..."
)
;;
