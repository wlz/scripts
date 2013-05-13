;; (define (reverse items)
;;   (define (insert tmp items)
;;     (if (null? items)
;; 	tmp
;; 	(insert (cons (car items) tmp) (cdr items))))
;;   (insert '() items))

(define (reverse items)
  (define (iter lst result)
    (if (null? lst)
	result
	(iter (cdr lst) (cons (car lst) result))))
  (iter items '()))
	
