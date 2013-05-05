(define (cont-frac n d k)
  (define (cons n d count)
    (let ((index (+ (- k count 1))))
      (if (> count k)
	  0
	  (/ (n count)
	     (+ (d count) (cons n d (+ count 1)))))))
  (cons n d 1))

(define one
  (lambda (x) 1.0))
	  
(define succ
  (lambda (x)
    (if (= (mod (- x 2) 3) 0)
	(/ (+ (* 2 x) 2) 3)
	1)))

(define (mod x y)
  (define (try count)
    (if (< x (* y count))
	(- x (* y (- count 1)))
	(try (+ count 1))))
  (if (< x y)
      -1
      (try 1)))

      
