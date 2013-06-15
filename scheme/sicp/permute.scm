(define (enumerate-interval1 low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval1 (+ low 1) high))))

(define (map1 proc sequence)
  (if (null? sequence)
    '()
    (cons (proc (car sequence))
	  (map1 proc (cdr sequence)))))

(define (filter1 predicate sequence)
  (if (null? sequence)
    '()
    (if (predicate (car sequence))
      (cons (car sequence) (filter1 predicate (cdr sequence)))
      (filter1 predicate (cdr sequence)))))

(define (bigger? x)
  (> x 3))

(define (accumulate1 op initial sequence)
  (if (null? sequence) 
    initial
    (op (car sequence)
	(accumulate1 op initial (cdr sequence)))))

(define (flatmap proc sequence)
  (accumulate1 append '() (map1 proc sequence)))

(define (remove1 item sequence)
  (filter1 (lambda (i) (not (= i item))) sequence))

(define (permutations s)
  (if (null? s)
    (list '())
    (flatmap (lambda (x)
	       (map (lambda (p) (cons x p))
		    (permutations (remove1 x s))))
	     s)))
