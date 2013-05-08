(define (cons a b)
  (lambda (m) (m a b)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 1 2))
(car (lambda (m) (m 1 2)))
((lambda(m) (m 1 2)) (lambda (p q) p))
((lambda (p q) p) 1 2)
(lambda (1 2) 1)
1

(cdr (cons 2 3))
(cdr (lambda (m) (m 2 3)))
((lambda (m) (m 2 3)) (lambda (p q) q))
((lambda (p q) q) 2 3)
(lambda (2 3) 3)
3


