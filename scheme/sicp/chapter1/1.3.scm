;; solution 1				

;; (define (sum-big a b c)
;;   (define (min x y)
;;     (if (< x y)
;; 	x
;; 	y))
;;   (define (squre x)
;;     (* x x))
;;   (- (+ (squre a)
;;   	(squre b)
;;   	(squre c))
;;      (squre (min c (min a b)))))

;; solution 2

(define (sum-big a b c)
  (define (max a b)
    (if (> a b)
	a
	b))
  (define (squre x)
    (* x x))
  (+ (squre (max a b))
     (squre (max a c))))
    

  
