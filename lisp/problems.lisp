(defproblem 1
    :description "If we list all the natural numbers below 10 that are
    multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these
    multiples is 23."
    
    
    :task "Find the sum of all the multiples of 3 or 5 below 1000."
    
    :fn (lambda ()
	  (load "01.lisp")
	  (p01:solution 3 5 1000)))