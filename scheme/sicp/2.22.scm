(define (square-list items)
  (define (iter things result)
    (if (null? things)
	result
	(cons ((lambda (x) (* x x)) (car things))
	      (iter (cdr things) result))))
  (iter items '()))
