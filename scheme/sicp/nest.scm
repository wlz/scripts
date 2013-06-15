(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
	((predicate (car sequence))
	 (cons (car sequence)
	       (filter predicate (cdr sequence))))
	(else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (map proc sequence)
  (if (null? sequence)
    '()
    (cons (proc (car sequence))
	  (map proc (cdr sequence)))))

(define (even-sum? pair)
  (even? (+ (car pair) (cadr pair))))

(define (make-sum-pair pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (even-sum-pairs n)
  (map make-sum-pair
       (filter even-sum? 
	       (accumulate append '()
			   (map (lambda (i)
				  (map 
				    (lambda (j) 
				      (list i j)) 
				    (enumerate-interval 1 (- i 1))))
				(enumerate-interval 1 n))))))



