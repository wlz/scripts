(define (reverse1 sequence)
  (fold-right 
    (lambda (first already-reversed) 
      (append already-reversed (list first)))
    '() sequence))

(define (reverse2 sequence)
  (fold-left 
    (lambda (x y)
      (cons y x))
    '() sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op (car rest) result)
	    (cdr rest))))
  (iter initial sequence))

(define (reverse2 sequence)
  (fold-left 
    (lambda (x y)
      (cons y x))
    '() sequence))

(reverse (list 1 2 3))

(define (reverse1 sequence)
  (fold-right 
    (lambda (first already-reversed) 
      (append already-reversed (list first)))
    '() sequence))

(define (reverse2 sequence)
  (fold-left 
    (lambda (x y)
      (cons y x))
    '() sequence))

(define (fold-right op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op (car rest) result)
	    (cdr rest))))
  (iter initial sequence))

(define (reverse2 sequence)
  (fold-left 
    (lambda (x y)
      (cons y x))
    '() sequence))

;(reverse (list 1 2 3))
;(1 result)
;(cons '() 1)
;(cons (cons '() 1) 2)
;(cons (cons (cons '() 1) 2) 3)
