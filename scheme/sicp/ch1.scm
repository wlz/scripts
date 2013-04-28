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
