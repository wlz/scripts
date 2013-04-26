(define (sum-int a b)
  (if (> a b)
      0
      (+ a
	 (sum-int (1+ a) b))))

(define (sum-sq a b)
  (if (> a b)
      0
      (+ (squre a)
	 (sum-sq (1+ a) b))))

(define (squre a)
  (* a a))

(define (sum_int a b)
  (if (> a b)
    0
    (+ a
       (sum_int (1+ a) b))))

