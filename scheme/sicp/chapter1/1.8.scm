(define (cube-root n)
  (fixed-point
   (lambda(x) (/ (+ (/ n (* x x)) (* 2 x)) 3))
   1))

(define (sqrt n)
  (fixed-point
   (lambda(x) (/ (+ (/ n x) x) 2))
   1))

(define (fixed-point fun start)
  (define (iter old new)
    (if (close-enough? old new)
	new
	(iter new (fun new))))
  (define (close-enough? old new)
    (< (abs (- new old)) 0.1))
  (define (abs x)
    (if (< x 0)
	(- x)
	x))
  (iter start (fun start)))


