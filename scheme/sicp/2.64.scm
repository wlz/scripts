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

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (car set)) #t)
	((< x (car set)) #f)
	(else
	  (element-of-set? x (cdr set)))))

(define (substract-sets set1 set2)
  (define (iter set result)
    (cond ((null? set) result)
	  ((element-of-set? (car set) set2)
	   (iter (cdr set) result))
	  (else
	    (cons (car set) (iter (cdr set) result)))))
  (iter set1 '()))

(define (pivot eles)
  (car (substract-sets eles (left-part eles))))

(define (right-part eles)
  (cdr (substract-sets eles (left-part eles))))

(define (list->tree1 eles)
  (let ((len (length eles)))
    (cond ((= 1 len) (list (car eles) '() '()))
	  ((= 2 len) (list (cadr eles) (car eles) '()))
;	  ((= 3 len) (list (cadr eles) (car eles) (caddr eles)))
	  (else
	    (list (pivot eles) (list->tree1 (left-part eles)) (list->tree1 (right-part eles)))))))

