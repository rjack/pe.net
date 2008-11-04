;;;; Giacomo Ritucci, 12.50 di martedì 15 luglio 2008

;;; Problem 4
;;;
;;; A palindromic number reads the same both ways. The largest palindrome made
;;; from the product of two 2-digit numbers is 9009 = 91 * 99.
;;;
;;; Find the largest palindrome made from the product of two 3-digit numbers.


(defun string-palindromic-p (str &optional (i 0) (j (1- (length str))) (it-is t))
  (if (>= i j)
    it-is
    (string-palindromic-p str (1+ i) (1- j) (char= (char str i) (char str j)))))


(defun palindromic-p (n)
  (string-palindromic-p (write-to-string n)))


(defclass tree ()
  ((exploring
     :initform nil
     :accessor exploring)
   (visited
     :initform nil
     :accessor visited)))


(defclass mul-tree (tree)
  ((op
     :initform #'*
     :accessor op)))


(defclass tree-state ()
  ((args
     :initform nil
     :initarg :args
     :accessor args)
   (value
     :accessor value)))


;;; Initialize tree-state objects
(defmethod initialize-instance :after ((this tree-state) &key op)
  (setf (value this) (reduce op (args this))))


;; TODO condizione di terminazione
(defmethod following-states ((this tree-state) op)
  (destructuring-bind (fst snd) (args this)
    (list
      (make-instance 'tree-state :args (list (1- fst) snd) :op op)
      (make-instance 'tree-state :args (list fst (1- snd)) :op op))))


(defmethod explore-further ((this tree) current-state &key stop-if)
  (push current-state (visited this))
  (dolist (state (following-states current-state (op this)))
    ;; TODO controllare che state non sia NIL
    (push state (exploring this)))	; TODO push solo se state non è tra i visited
  (sort (exploring this) #'> :key #'value))


(defmethod walk ((this tree) args &key stop-if)
  (let ((current-state (make-instance 'tree-state :args args :op (op this))))
    (if (apply stop-if (value current-state) nil)
      (value current-state)
      (explore-further this current-state :stop-if stop-if))))


(let ((tree (make-instance 'mul-tree)))
  (format t "~a~%" (walk tree (list 999 999) :stop-if #'palindromic-p)))
