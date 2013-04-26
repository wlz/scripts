(define (sum term a next b)
  (define (iter j ans)
    (if (> j b)
      ans
      (iter (next j)
	    (+ (term j) ans))))
  (iter a 0))

(define (sum-int a b)
  (sum 
    (lambda(x) x)
    a
    1+ 
    b))

(define (sum-sq a b)
  (sum 
    (lambda(x) (* x x))
    a 
    1+
    b))

(define (sum-pi a b)
  (sum
    (lambda(x) (/ 1 (* x (+ x 2))))
    a
    (lambda(x) (+ 4 x))
    b))


