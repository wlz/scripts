(define (list->tree elements)
  (car (partial-tree elements (length (elements)))))

(define (partial-tree elets n)
  (if (= n 0)
    (cons '() elets)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result
	      (partial-tree elets left-size)))
	(let ((left-tree (car left-result))
	      (non-left-elts (cdr left-result))
	      (right-size (- n (+ left-size 1))))
	  (let ((this-entry (car non-left-elts))
		(right-result 
		  (partial-tree
		    (cdr non-left-elts)
		    right-size)))
	    (let ((right-tree (car right-result))
		  (remainning-elts
		    (cdr right-result)))
	      (cons (make-tree this-entry
			       left-tree
			       right-tree)
		    remainning-elts)))))))) 

