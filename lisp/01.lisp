;;;; Giacomo Ritucci, 23.37 di venerdì 14 dicembre 2007

;;; Problem 1
;;;
;;; If we list all the natural numbers below 10 that are multiples of 3 or 5,
;;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;;
;;; Find the sum of all the multiples of 3 or 5 below 1000.

(print (do ((i 0 (1+ i))
	    (sum 0))
	 ((>= i 1000) sum)
	 (if (or (= 0 (mod i 3))
		 (= 0 (mod i 5)))
	   (incf sum i))))
