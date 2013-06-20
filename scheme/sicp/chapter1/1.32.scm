(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate (lambda(x y) (+ x y)) 0 term a next b))

(define (sum-iter term a next b)
  (accumulate-iter (lambda(x y) (+ x y)) 0 term a next b))

(define (product term a next b)
  (accumulate (lambda(x y) (* x y)) 1 term a next b))

(define (product-iter term a next b)
  (accumulate (lambda(x y) (* x y)) 1 term a next b))

(define (sum-int a b)
  (sum (lambda(x) x)
       a
       (lambda(x) (+ x 1))
       b))

(define (sum-int-iter a b)
  (sum-iter (lambda(x) x)
	    a
	    (lambda(x) (+ x 1))
	    b))

(define (factorial a b)
  (product (lambda(x) x)
	   a
	   (lambda(x) (+ x 1))
	   b))

(define (factorial-iter a b)
  (product-iter (lambda(x) x)
		a
		(lambda(x) (+ x 1))
		b))
	      
