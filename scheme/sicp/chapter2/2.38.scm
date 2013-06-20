(define (fold-right1 op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(fold-right1 op initial (cdr sequence)))))


(define (fold-right2 op initial sequence)
  (if (null? sequence)
    initial
    (op (fold-right2 op initial (cdr sequence))
	(car sequence))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

;(accumulate + 0 (list 1 2 3))
;(+ 1 (+ 2 (+ 3 0)))

;(accumulate cons '() (list 1 2 3))
;(cons 1 (cons 2 (cons 3 '())))
;
;(accumulate list '() (list 1 2 3))
;(list 1 (list 2 (list 3 '())))

(define (fold-left1 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
	    (cdr rest))))
  (iter initial sequence))

(define (fold-right3 op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op (car rest) result)
	    (cdr rest))))
  (iter initial sequence))

