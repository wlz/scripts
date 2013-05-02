(define (squre x)
  (* x x))

(define (sum-sq x y)
  (+ (squre x)
     (squre y)))

(define (sum-of-squres a)
  (sum-sq (+ a 1) (* a 2)))

;; abs
 ;; (define (abs x)
 ;;  (cond ((> x 0) x)
 ;; 	((< x 0) (- x))
 ;; 	(else 0))) 

	;; ((= x 0) 0))) 

;; (define (abs x)
;;   (if (< x 0)
;;       (- x)
;;       x))

;; (define (abs x)
;;   (if (< x 0)
;;       (- x)
;;       x
;; ))

(define (abs x)
  (if (and (> x 0) (= x 0))
      x
      (- x)))

;; recursive factorial

;; (define (fact n)
;;   (if (= n 1)
;;       n
;;       (* n (fact (- n 1)))))

;; iteration factorial

(define (fact n)
  (define (iter product counter)
    (if (> counter n)
	product
	(iter (* counter product)
	      (+ counter 1))))
  (iter 1 1))

;; complext factorial

(define (factorial n)
  (iter 1 1 n))

(define (iter product counter max-counter)
  (if (> counter max-counter)
      product
      (iter (* product counter)
	    (+ counter 1)
	    max-counter)))


(define (fib n)
  (cond ((= n 0) 1)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

(define (iter-fib n)
  (define (iter a b count)
    (if (= count 0)
	b
	(iter (+ a b) a (- count 1))))
  (iter 1 0 n))


;; (fib 5)

;; (+ (fib 4)
;;    (fib 3))

;; (+ (+ (fib 3)
;;       (fib 2))
;;    (+ (fib 2)
;;       (fib 1)))

;; (+ (+ (+ (fib 2)
;; 	 (fib 1))
;;       (+ (fib 1)
;; 	 (fib 0)))
;;    (+ (+ (fib 1)
;; 	 (fib 0))
;;       (fib 1)))

;; (+ (+ (+ (+ (fib 1)
;; 	    (fib 0))
;; 	 (fib 1))
;;       (+ (fib 1)
;; 	 (fib 0)))
;;    (+ (+ (fib 1)
;; 	 (fib 0))
;;       (fib 1)))

;; (+ (+ (+ (+ 1 1) 1) 1)
;;    (+ (+ 1 1) 1)
;;    (+ (+ (+ 2 1) 1)
;;       (+ 2 1))

;; (define (sum-int a b)
;;   (if (> a b)
;;       0
;;       (+ a (sum-int (+ a 1) b))))

;; (define (sum-cubes a b)
;;   (if (> a b)
;;       0
;;       (+ (* a a a)
;; 	 (sum-cubes (+ a 1) b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (sum-int a b)
  (define (identity a) a)
  (sum
   ;; identity
   (lambda(x) x)
   a
   1+ b))

(define (sum-cubes a b)
  (sum
   (lambda(x) (* x x x))
   a
   (lambda(x) (+ 1 x))
   b))

(define (pi-sum a b)
  (sum
   (lambda(x) (/ 8 (* x (+ x 2))))
   a
   (lambda(x) (+ x 4))
   b))

(define (integral f a b dx)
  (* (sum
      f
      (+ a (/ dx 2.0))
      (lambda(x) (+ x dx))
      b)
     dx))

(define (cube x)
  (* x x x))
  
	  

