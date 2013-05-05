(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) 0.0001))

(define (average x y)
  (/ (+ x y) 2))
