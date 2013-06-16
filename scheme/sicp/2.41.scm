(define (equals? s n)
  (= s n))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low 
	  (enumerate-interval (+ low 1) high))))

(define (flatmap proc sequence)
  (accumulate append '() (map proc sequence)))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (remove item sequence)
  (if (null? sequence)
    '()
    (if (= (car sequence) item)
      (remove item (cdr sequence))
      (cons (car sequence) (remove item (cdr sequence))))))


(define (gen n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j) 
			(map (lambda (k) (list i j k))
			     (remove i (remove j (enumerate-interval 1 n)))))
		      (remove i (enumerate-interval 1 n))))
	   (enumerate-interval 1 n)))

(define (seq-equal n s)
  (filter (lambda (i) (= s (sum-triple i))) (gen n)))

(define (sum-triple triple)
  (+ (car triple)
     (cadr triple)
     (caddr triple)))
