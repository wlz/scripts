(define (length eles)
  (if (null? eles)
    0
    (+ (length (cdr eles))
       1))) 

(define (append items1 items2)
  (if (null? items1)
    items2
    (cons (car items1) (append (cdr items1) items2))))

(define (left-part eles)
  (let ((half (- (quotient (length eles) 2) 1)))
    (define (iter items result)
      (if (> (length result) half)
	result
	(iter (cdr items) (append result (list (car items))))))
    (iter eles '())))
  

