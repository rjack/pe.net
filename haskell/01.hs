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
z = 1000


multiples a =
    [a, 2*a .. ]


starters a b =
    let    axb = a*b
    in     (takeWhile ((>) axb) (multiples a)) ++
           (takeWhile ((>) axb) (multiples b)) ++
	   [axb]


uniqueMultiplies a b =
    map (\x -> [x, a*b+x .. ])
        (starters a b)


solution =
    sum (concat (map (takeWhile ((>) z)) (uniqueMultiplies a b)))
