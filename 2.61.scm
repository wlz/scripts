(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (car set)) #t)
	((> x (car set)) #f)
	(else
	  (element-of-set? x (cdr set)))))

(define (append x1 x2)
  (if (null? x1)
    x2
    (cons (car x1) (append (cdr x1) x2))))

(define (bigger x set1)
  (cond ((null? set1) '())
	((< x (car set1))
	 (cons (car set1) (bigger x (cdr set1))))
	(else
	  (bigger x (cdr set1)))))

(define (litter x set1)
  (cond ((null? set1) '())
	((> x (car set1))
	 (cons (car set1) (litter x (cdr set1))))
	(else
	  (litter x (cdr set1)))))

(define (adjoin x set)
  (append (append (litter x set) (list x))
	  (bigger x set)))


(define (filter1 proc items)
  (cond ((null? items) '())
	((proc (car items))
	 (cons (car items) (filter1 proc (cdr items))))
	(else 
	  (filter1 proc (cdr items)))))

(define (big x set)
  (filter1 (lambda(m) (> m x)) set))

(define (small x set)
  (filter1 (lambda(m) (< m x)) set))

(define (adjoin x set)
  (append (append (small x set) (list x))
	  (big x set)))
