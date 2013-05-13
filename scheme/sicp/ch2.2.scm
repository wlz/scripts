(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

;; (define (length items)
;;   (if (null? items)
;;       0
;;       (+ 1 (length (cdr items)))))

(define (length items)
  (define (length-iter a count)
    (if (null? a)
	count
	(length-iter (cdr a) (+ count 1))))
  (length-iter items 0))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (scale-list items factor)
  (if (null? items)
      '()
      (cons (* factor (car items))
	    (scale-list (cdr items) factor))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (map proc (cdr items)))))

(define (scale items factor)
  (map (lambda (x) (* x factor)) items))

(define (minus items n)
  (map (lambda (x) (- x n)) items))

(define (count-leaves x)
  (cond ((null? x) 0)
	((not (pair? x)) 1)
	(else (+ (count-leaves (car x))
		 (count-leaves (cdr x))))))

		      
