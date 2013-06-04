(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)) 

(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
			 (if (pair? node)
			   (count-leaves node)
			   1))
		       t)))
