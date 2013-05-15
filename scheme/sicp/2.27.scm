(define (reverse items)
  (define (iter lst result)
    (if (null? lst)
	result
	(iter (cdr lst) (cons (car lst) result))))
  (iter items '()))

;; (define (deep-reverse tree)
;;   (cond ((null? tree) '())
;; 	((not (pair? tree)) tree)
;; 	(else (reverse (list (deep-reverse (car tree))
;; 			     (deep-reverse (cadr tree)))))))

(define (deep-reverse
