(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
      product
      (iter (* product counter)
	    (+ counter 1))))
  (iter 1 1))

(define (factorial1 n)
  (let ((product 1) (counter 1))
    (define (iter)
      (if (> counter n)
	product
	(begin (set! product (* product counter))
	       (set! counter (+ counter 1))
	       (iter))))
    (iter)))
