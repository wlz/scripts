(define (square x)
  (* x x))

(define mk 
  (lambda (x) 
    ((define (square m)
       (+ m 1)))
    (square x)))
