(define (sum-odd-squares tree)
  ((cond ((null? tree) 0)
	 ((not (pair? tree)) 
	  (if (odd? tree) (square 
