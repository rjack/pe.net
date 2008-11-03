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
  ((current
     :initform nil
     :accessor current)
   (exploring
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
   (result
     :accessor result)))


;;; Initialize tree-state objects
(defmethod initialize-instance :after ((this tree-state) &key op)
  (setf (result this) (reduce op (args this))))


(defmethod walk ((this tree) args &key stop-if)
  (let ((current (make-instance 'tree-state :args args :op #'*)))
    (cond ((funcall stop-if (result current)) (result current)))))


(let ((tree (make-instance 'mul-tree)))
  (format t "~a~%" (walk tree (list 999 999) :stop-if #'palindromic-p)))
