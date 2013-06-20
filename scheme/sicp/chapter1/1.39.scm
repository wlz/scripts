(define (cont-frac n d k)
  (define (cons n d count)
    (let ((index (+ (- k count) 1)))
      (if (> count k)
	  0
	  (/ (n index)
	     (+ (d index) (cons n d (+ count 1)))))))
  (cons n d 1))

(define one
  (lambda (i) 1.0))


(define (tan-cf x k)
  (cont-frac (lambda (i)
	       (if (= i 1) x (* -1.0 x x)))
	     (lambda (i) (- (* 2.0 i) 1))
	     k))

	  
