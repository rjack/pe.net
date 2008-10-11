(* Giacomo Ritucci, 21.24 di sabato 11 ottobre 2008 *)

(* Problem 3
 *
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ? *)

(* You need to link to the num.cme module: ocamlc nums.cma 03.ml *)
open Num

let rec largest_prime_factor (n : num) (i : num) =
        if (n // (num_of_int 2)) <=/ i
                then n
                else if mod_num n i = num_of_int 0
                        then largest_prime_factor (n // i) i
                        else largest_prime_factor n (i +/ num_of_int 1);;


let solve_problem (n : num) =
        largest_prime_factor n (num_of_int 2);;

(* OCaml type system, yay! *)
Printf.printf "%d\n" (int_of_num (solve_problem (num_of_string "600851475143")));;
