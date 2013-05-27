(define (append src app)
  (define (iter lst result)
    (if (null? lst)
      result
      (iter (cdr lst) (cons result (car lst)))))
  (iter app src))
