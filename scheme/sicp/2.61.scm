(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (car set)) #t)
	((< x (car set)) #f)
	(else
	  (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< x (car set)) (cons x set))
	((= x (car set)) set)
	(else
	  (cons (car set) (adjoin-set x (cdr set))))))
