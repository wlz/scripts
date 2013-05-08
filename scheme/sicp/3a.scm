(define make-segment cons)

(define seg-start car)

(define seg-end cdr)

(define make-vector cons)

(cons 1 (cons 2 (cons 3 (cons 4 '()))))

(define one-to-four (list 1 2 3 4))

;; (define (scale-list s l)
;;   (if (null? l)
;;       nil
;;       (cons
