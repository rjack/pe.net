(defpackage :org.altervista.rjack.pe.browser
  (:nicknames :browser)
  (:use :cl)
  (:export :problem))

(declaim (optimize debug safety (speed 0)))

(defparameter *descriptions* (make-hash-table))
(defparameter *titles* ())


(defun problem (&key (id nil id?)
                     (title nil title?)
                     (description nil description?))
  (declare (fixnum id)
	   (boolean id? title? description?)
	   (string title description))
  (when (not (and id? title? description?))
    (error "Malformed entry in problem-db."))
  (setf (gethash id *descriptions*) description)
  (push (list :id id :title title) *titles*))


(defun !quit ()
  (format t "~&Bye~%")
  (quit))


(defun !list-problems ()
  (labels ((!print-entry (entry)
	     (format *query-io* "~&~3D   ~A"
		     (getf entry :id)
		     (getf entry :title))))
    (format *query-io* "~%PROBLEMS")
    (mapc #'!print-entry *titles*)))


(defun !display-problem-menu (id)
  (format *query-io* "~&Problem ~D~%~%~A~%"
	  id (gethash id *descriptions*))
  (yes-or-no-p "Solve?"))


(defun !display-main-menu ()
  (labels ((!read-user-input ()
	     (format *query-io* "~&i: pick i-th problem, q: quit > ")
	     (force-output *query-io*)
	     (let ((input (read-line *query-io*)))
	       (if (string= "q" input)
		   (!quit)
		   (let ((id (parse-integer input :junk-allowed t)))
		     (if (not (null id))
			 id
			 (!read-user-input)))))))
    (!list-problems)
    (!display-problem-menu (!read-user-input))
    (!display-main-menu)))


(load "problem-db.lisp")
(setf *titles* (nreverse *titles*))
(!display-main-menu)