(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter?  a)
	  (combiner (term a)
		    (filtered-accumulate filter? combiner null-value term (next a) next b))
	  (combiner null-value
		    (filtered-accumulate filter? combiner null-value term (next a) next b)))))
	   

(define (condition? x)
  (> x 3))

(define (sum a b)
  (filtered-accumulate condition? (lambda(x y) (+ x y)) 0 (lambda(x) x) a (lambda(x) (+ x 1)) b))

(define (factorial a b)
  (filtered-accumulate condition? (lambda(x y) (* x y)) 1 (lambda(x) x) a (lambda(x) (+ x 1)) b))
