(define (memq1 item x)
  (cond ((null? x) #f)
	((eq? item (car x)) x)
	(else (memq1 item (cdr x)))))

