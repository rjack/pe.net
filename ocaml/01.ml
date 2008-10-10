(* Giacomo Ritucci, 19.01 di venerdì 10 ottobre 2008 *)

(* Problem 1
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5, we
 * get 3, 5, 6 and 9. The sum of these multiples is 23.
 *
 * Find the sum of all the multiples of 3 or 5 below 1000. *)


(* Somma i multipli di n, a partire dall'i-esimo, finchè sono minori di max *)
let rec multipliers_sum n i max =
        let mul = n * i in 
                if mul >= max then 0 else mul + multipliers_sum n (i + 1) max;;


(* Risolve il problema, trovando la somma di tutti i multipli di 3 minori di
 * 1000, sommandola alla somma di tutti i multiplidi 5 minori di 1000, infine
 * sottraendo la somma di tutti i multipli comuni. *)
let solve_problem x y max =
        multipliers_sum x 1 max
        + multipliers_sum y 1 max
        - multipliers_sum (x * y) 1 max;;


Printf.printf "%d\n" (solve_problem 3 5 1000);;
