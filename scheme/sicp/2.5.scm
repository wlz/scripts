(define (exp a b)
  (if (> b 0)
      (* a (exp a (- b 1)))
      1))

(define (cons x y)
  (* (exp 2 x)
     (exp 3 y)))

(define (remainer n d)
  (define (try count)
    (if (> (* d count) n)
	(- n (* d (- count 1)))
	(try (+ count 1))))
  (try 1))

(define (rem-count n d)
  (define (try count)
    (if (= (remainer n (exp d count)) 0)
	(try (+ count 1))
	(- count 1)))
  (try 1))

(define (car n)
  (rem-count n 2))

(define (cdr n)
  (rem-count n 3))

