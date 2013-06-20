(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

(define (factorial a b)
  (product (lambda(x) x) a (lambda(x) (+ 1 x)) b))

(define (pi-pro a b)
  (* (product (lambda(x) (/ (* 2 x) (+ 1 (* 2 x))))
	      a
	      (lambda(x) (+ x 2))
	      b)
     (product (lambda(x) (/ (+ 2 (* 2 x)) (+ 1 (* 2 x))))
	      a
	      (lambda(x) (+ x 2))
	      b)))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))


(define (iter-fact a b)
  (product-iter (lambda(x) x) a (lambda(x) (+ x 1)) b))
	       
	       
	    
