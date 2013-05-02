(define (pascal i j)
  (cond ((or (< i 0)
	     (< j 0)
	     (> j i))
	 0)
	((or (= 1 j)
	     (= i j))
	 1)
	(else
	 (+ (pascal (- i 1) (- j 1))
	    (pascal (- i 1) j)))))

(define (pascal-iter i j)
  
