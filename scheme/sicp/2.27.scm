(define (deep-reverse items)
  (define (iter lst result)
    (if (null? lst)
	result
	(let ((first (car lst)))
	  (iter (cdr lst)
		(cons (if (pair? first)
			   (deep-reverse first)
			   first)
		      result)))))
  (iter items '()))

