(define (make-segment start-x start-y end-x end-y)
  (cons (make-point start-x start-y)
	 (make-point end-x end-y)))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment seg)
  (cons (/ (+ (car (car seg))
	      (car (cdr seg)))
	   2)
	(/ (+ (cdr (car seg))
	      (cdr (cdr seg)))
	   2)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))
