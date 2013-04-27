(define (sqrt n)
  (fixed-point
   (lambda(x) (/ (+ x (/ n x)) 2))
   2))
     
(define (fixed-point fun start)
  (define (iter old new)
    (if (close-enough? old new)
	new
	(iter new (fun new))))
  (define (close-enough? old new)
    (< (abs (- new old)) tolerance))
  (define tolerance 0.0001)
  (iter start (fun start)))



