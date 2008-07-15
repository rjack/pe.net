;;;; Giacomo Ritucci, 02.03 di martedì 15 luglio 2008

;;; Problem 3
;;;
;;; The prime factors of 13195 are 5, 7, 13 and 29.
;;;
;;; What is the largest prime factor of the number 317584931803?

(defun largest-prime-factor (n &optional (i 2))
  (cond ((= n i) n)
	((= 0 (mod n i)) (largest-prime-factor (/ n i) i))
	(T (largest-prime-factor n (incf i)))))

(largest-prime-factor 600851475143)
