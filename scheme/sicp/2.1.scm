(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (and (< n 0)
	     (< d 0))
	(cons (/ (* n -1) g)
	      (/ (* d -1) g))
	(cons (/ n g) (/ d g)))))

(define (positive? x)
  (> x 0))

(define (negative? x)
  (< x 0))

;; (define (gcd x y)
;;   (define (search small big div result)
;;     (if (> div small)
;; 	result
;; 	((if (and (= (mod small div) 0)
;; 		  (= (mod big div) 0))
;; 	     (set div result))
;; 	 (search small big (+ div 1) result))))
;;   (if (> x y)
;;       (search y x 1 1)
;;       (search x y 1 1))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (mod a b))))
  
(define (mod n d)
  (define (try count)
    (if (> (* count d) n)
	(- n (* d (- count 1)))
	(try (+ count 1))))
  (if (< n d)
      -1
      (try 1)))
