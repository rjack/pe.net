(defun seq (from by to)
  (loop for i from from to to by by collecting i))


(defun fibonacci-sequence (n)
  "Return a list containing the first n elements of the fibonacci
  sequence"
  (loop repeat n
    	for x = 0 then y
	and y = 1 then (+ x y)
	collecting y))


(defun fibonacci-sequence-below (limit)
  "Return a list containing the elements of the fibonacci sequence
  below limit"
  (loop for x = 0 then y
	and y = 1 then (+ x y)
	while (< y limit)
	collecting y))


(defun fibonacci (n)
  "Return the n-th element in the fibonacci sequence"
  (loop repeat n
	for x = 0 then y
	and y = 1 then (+ x y)
	finally (return y)))


(defun fibonacci-below (limit)
  "Return the greatest element below limit in the fibonacci sequence"
  (loop for x = 0 then y
	and y = 1 then (+ x y)
	while (< y limit)
	finally (return x)))
