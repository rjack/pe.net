;;; Problem 1
;;;
;;; If we list all the natural numbers below 10 that are multiples of 3 or 5,
;;; we get 3, 5, 6 and 9. The sum of these multiples is 23.
;;;
;;; Find the sum of all the multiples of 3 or 5 below 1000.


(defparameter *a* 3)
(defparameter *b* 5)
(defparameter *z* 1000)
(defparameter *axb* (* *a* *b*))


(defun seq (from by to)
  (loop for i from from to to by by collecting i))


(defun starters (a b)
  (let ((to (1- *axb*)))
    (append (seq a a to) (seq b b to) (list *axb*))))


(defun sum (from by to)
  (loop for i from from to to by by
	summing i into s
	finally (return s)))


(defun solution ()
  (reduce '+(map
	       'list #'(lambda (n)
			 (sum n *axb* (1- *z*)))
	       (starters *a* *b*))))
