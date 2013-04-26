(if (> a b)
(define (sum-int a b)
      0
      (+ a
	 (sum-int (1+ a) b))))

(sum-int 1 5)

(define (sum-sq a b)
  (if (> a b)
      0
      (+ (squre a)
	 (sum-sq (1+ a) b))))

(define (squre a)
  (* a a))

(sum-sq 6 7)

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1 (* a (+ a 2)))
	 (pi-sum (+ a 4) b))))

(pi-sum 1 22)

(* 6 (pi-sum 1 10))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term
	      (next a)
	      next
	      b))))

(define (sum-int a b)
  (sum (lambda(x) x) a 1+ b))

(define (sum-pi a b)
  (sum (lambda(x) (/ 1 (* x (+ x 2))))
       a
       (lambda(i) (+ i 4))
       b))

(sum-pi 1 3)

(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enough? u v)
    (< (abs (- u v)) tolerance))
  (define (iter old new)
    (if (close-enough? old new)
	new 
	(iter new (f new))))
  (iter start (f start)))

(define (sqrt x)
  (fixed-point 
   (lambda(y) (average (/ x y) y))
   1))

(define (average x y)
  (/ (+ x y) 2 ))

(sqrt 3)

