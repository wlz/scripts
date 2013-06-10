(define (fold-right1 op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(fold-right1 op initial (cdr sequence)))))


(define (fold-right2 op initial sequence)
  (if (null? sequence)
    initial
    (op (fold-right2 op initial (cdr sequence))
	(car sequence))))

(define (fold-left1 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))
