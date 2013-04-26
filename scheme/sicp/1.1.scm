(+ 5 3 4)
(- 9 1)
(+ (* 2 4) (- 4 6))

(define a 3)
(define b (+ a 1))
(+ a b)
(+ a b (* a b))
(= a b)

(if (and (> b a) (< b (* a b)))
    b
    a)

(define (squre x) 
  (* x x))

(+ (squre 3) (squre 4))

(define tri
  (lambda(x y)
    (+ (squre x)
       (squre y))))

(tri 3 4)

(define (tri x y)
  (+ (squre (tri 3 4)

(define (sum_of_squres x y)
  (+ (squre x)
     (squre y)))

(sum_of_squres 4 5)

(define sum_of_squres
  (lambda (x y)
    (+ (squre x)
       (squre y))))

(sum_of_squres 4 5)
