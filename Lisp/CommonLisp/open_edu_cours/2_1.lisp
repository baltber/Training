(defun print-n-randoms (n max)
  (dotimes (i n)
    (format t "~r~%" (random max))))

(defun ff (n)
    (if (= 4 (+ n 2))
	(progn (print "YES")
	       (print "re"))))
