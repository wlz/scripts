(define (+ x y)
  (if (= x 0)
      y
      (+ (-1+ x) (1+ y))))

(+ 3 4)

(define (+ x y)
  (if (= x 0)
      y
      (1+ (+ (-1+ x) y))))

(+ 4 5)

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
	 (fib (- n 2)))))

(fib 12)
	  