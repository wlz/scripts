(define (rec n)
  (if (< n 3)
      n
      (+ (rec (- n 1))
	 (rec (- n 2))
	 (rec (- n 3)))))

(define (iter n)
  (define (iter-count a b c count)
    (if (= count 0)
	c
	(iter-count (+ a b c) a b (- count 1))))
  (iter-count 2 1 0 n))
	      
