(* Giacomo Ritucci, 13.07 del 12 ottobre 2008 *)

(* Problem 4
 *
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers. *)

open String;;


(* True if the first and the last charachers in a string are equal. *)
let extremes_match =
  fun str ->
    (str.[0] = str.[length str - 1]);;


(* Integer exponentiation *)
let ( *** ) =
  fun x y ->
    int_of_float ((float_of_int x) ** (float_of_int y));;


(* example: "hello" -> "ell" *)
let strip_extremes =
  fun str ->
    (sub str 1 (length str - 2));;


let rec is_palindromic =
  fun str ->
    match length str with
        1                                               -> true
      | 2 when (extremes_match str)                     -> true
      | _ when (extremes_match str
                && is_palindromic (strip_extremes str)) -> true
      | _                                               -> false;;


let max =
  fun x y ->
    match x < y with
        true  -> y
      | false -> x;;


let rec list_numbers =
  fun int_start int_end ->
    match int_end - int_start with
        0 -> [ int_end ]
      | _ -> int_start :: (list_numbers (int_start + 1) int_end);;


let list_n_digits_numbers =
  fun n ->
    match n with
        0 -> []
      | _ -> list_numbers (10 *** (n - 1)) ((10 *** n) - 1);;
