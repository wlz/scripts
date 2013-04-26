(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (sum-int a b)
  (sum (lambda(x) x) a 1+ b))

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
    (lambda(x) (+ x 4)) 
    b))



