;; (define (sqrt n)
;;   (define (fixed-point fun guess)
;;     (define (iter guess)
;;       (if (good-enough? guess)
;; 	  guess
;; 	  (iter (fun guess))))
;;     (define (good-enough? guess)
;;       (< (abs (- (* guess guess) n)) tolerance))
;;     (define (abs x)
;;       (if (< x 0)
;; 	  (- x)
;; 	  x))
;;     (define tolerance 0.0001)
;;     (iter guess)
;;   (fixed-point
;;    (lambda(x) (/ (+ x (/ n x)) 2))
;;    1)))

(define (sqrt n)
  (fixed-point
   (lambda(x) (/ (+ x (/ n x)) 2))
   1
   n))

(define (fixed-point fun guess n)
  (define (iter guess)
    (if (good-enough? guess)
	guess
	(iter (fun guess))))
  (define (good-enough? guess)
    (< (abs (- (* guess guess) n)) 0.0001))
  (iter 1))
	  
