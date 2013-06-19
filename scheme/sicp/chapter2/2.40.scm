(define (enumerate-interval1 low high)
  (if (> low high)
    '()
    (cons low
	  (enumerate-interval1 (+ low 1) high))))

(define (map1 proc sequence)
  (if (null? sequence)
    '()
    (cons (proc (car sequence))
	  (map1 proc (cdr sequence)))))

(define (accumerate1 op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumerate1 op initial (cdr sequence)))))

(define (append1 src app)
  (define (iter seq result)
    (if (null? seq)
      result
      (cons (car seq)
	    (iter (cdr seq) result))))
  (iter src app))

(define (flatmap proc sequence)
  (accumerate1 append1 '()
	      (map proc sequence)))

(define (sum-bigger? x)
  (> (+ (car x) (cadr x)) 5))

(define (unique-pairs n)
  (flatmap (lambda (i)
	 (map (lambda (j) (list i j))
	      (enumerate-interval1 1 (- i 1))))
       (enumerate-interval1 1 n)))

(define (filter predicate sequence)
  (if (null? sequence)
    '()
    (if (predicate (car sequence))
      (cons (car sequence)
	    (filter predicate (cdr sequence)))
      (filter predicate (cdr sequence)))))

(define (seq-sum-bigger n)
  (filter sum-bigger? 
	  (unique-pairs n)))
