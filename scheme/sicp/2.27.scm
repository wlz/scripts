;; (define (reverse items)
;;   (define (iter lst result)
;;     (if (null? lst)
;; 	result
;; 	(iter (cdr lst) (cons (car lst) result))))
;;   (iter items '()))

(define (reverse items)
  (define (iter lst result)
    (if (null? lst)
	result
	(iter (cdr lst) (cons (car lst) result))))
  (iter items '()))


