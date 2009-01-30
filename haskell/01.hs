{----------------------------------------------------------------------------
 |
 | Giacomo Ritucci, 1.34 di giovedì 29 gennaio 2009
 |
 | Problem 1
 | If we list all the natural numbers below 10 that are multiples of 3 or 5,
 | we get 3, 5, 6 and 9. The sum of these multiples is 23.
 |
 | Find the sum of all the multiples of 3 or 5 below 1000.
 |
 +--------------------------------------------------------------------------}

module Problem01
	where

a = 3
b = 5
z = 999

enumFromByTo from by to = [from, from + by .. to]

solution =
	let	step = a * b
	in	sum []
	
-- TODO
-- (enumFromByTo a step z ++ enumFromByTo 6 step z ++ [9, (9 + step) .. z] ++ [12, (12 + step) .. z] ++ [15, (15 + step) .. z] ++ [5, (5 + step) .. z] ++ [10, 10 + step .. z])
