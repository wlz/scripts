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

(define (deep-rev tree)
  (define (iter lst result)
    (if (null? lst)
      result
      (let ((first (car lst)))
	(iter (cdr lst)
	      (cons (if (pair? first)
		      (deep-rev first)
		      first)
		    result)))))
  (iter tree '()))


