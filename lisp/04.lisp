;;;; Giacomo Ritucci, 12.50 di martedì 15 luglio 2008

;;; Problem 4
;;;
;;; A palindromic number reads the same both ways. The largest palindrome made
;;; from the product of two 2-digit numbers is 9009 = 91 * 99.
;;;
;;; Find the largest palindrome made from the product of two 3-digit numbers.


(defun digits (n)
  "Ritorna il numero di cifre di n"
  (if (< n 10)
       1
       (+ 1 (digits (floor (/ n 10))))))


(defun most-significant-digit (n)
  "Ritorna la cifra piu' significativa di n"
  (floor (/ n (expt 10 (- (digits n) 1)))))


(defun least-significant-digit (n)
  "Ritorna la cifra meno significativa di n"
  (- n (* 10 (floor (/ n 10)))))


(defun strip-most-significant-digit (n)
  "Ritorna n senza la sua cifra piu' significativa. Es: 1234 -> 234"
  (- n (* (most-significant-digit n) (expt 10 (- (digits n) 1)))))


(defun strip-least-significant-digit (n)
  "Ritorna n senza la sua cifra meno significativa. Es: 1234 -> 123"
  (floor (/ (- n (least-significant-digit n)) 10)))


(defun is-palindrome (n)
  "Ritorna T se n e' palindromo, NIL altrimenti"
  (cond ((= 1 (digits n)) T)
	((and (= 2 (digits n))
	      (= 0 (mod n 11))) T)
	((and (= (most-significant-digit n)
		 (least-significant-digit n))
	      (is-palindrome
		(strip-most-significant-digit
		  (strip-least-significant-digit n))) T))
	(T NIL)))
