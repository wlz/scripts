(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (list-squre items)
  (map (lambda (x) (* x x)) items))


       
