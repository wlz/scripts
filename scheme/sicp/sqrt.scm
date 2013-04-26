(define (sqrt n)
  (fixed-point
    (lambda(x) (/ (+ x (/ n x)) 2))
    1))

(define (fixed-point fun start)
  (define (iter old new)
    (if (close-enough? old new)
      new
      (iter new (fun new))))
  (define (close-enough? old new)
    (< (abs (- new old)) tolerance))
  (define (abs x)
    (if (< x 0)
      (* x -1)
      x))
  (define tolerance 0.00001)
  (iter start (fun start)))

