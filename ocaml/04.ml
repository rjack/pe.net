(* Giacomo Ritucci, 13.07 del 12 ottobre 2008 *)

(* Problem 4
 *
 * A palindromic number reads the same both ways. The largest palindrome made
 * from the product of two 2-digit numbers is 9009 = 91 × 99.
 *
 * Find the largest palindrome made from the product of two 3-digit numbers. *)

open String;;


let extremes_match = function str -> (str.[0] = str.[length str - 1]);;

let strip_extremes = function str -> (sub str 1 (length str - 2));;

let rec is_palindromic (str : string) = match length str with
        | 1                                                                  -> true
        | 2 when (extremes_match str)                                        -> true
        | _ when (extremes_match str && is_palindromic (strip_extremes str)) -> true
        | _                                                                  -> false;;
