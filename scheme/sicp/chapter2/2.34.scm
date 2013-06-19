(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence))))) 

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coff sum)
		(+ this-coff
		   (* x sum)))
	      0
	      coefficient-sequence))
