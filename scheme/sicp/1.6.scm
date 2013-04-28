(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt x)
  (fixed-point
   (lambda(n) (/ (+ n (/ x n)) 2))
   1))

;; (define (fixed-point fun start)
;;   (define (iter old new)
;;     (if (close-enough? old new)
;; 	new
;; 	(iter new (fun new))))
;;   (define (close-enough? old new)
;;     (< (abs (- new old)) tolerance))
;;   (define tolerance 0.0001)
;;   (iter start (fun start)))

(define (fixed-point fun start)
  (define (iter old new)
    
    ;; (if (close-enough? old new)
    ;; 	new
    ;; 	(iter new (fun new))))
    
    ;; (cond ((close-enough? old new) new)
    ;; 	  (else (iter new (fun new)))))

    (new-if (close-enough? old new)
  	    new
  	    (iter new (fun new))))
  
  (define (close-enough? old new)
    (< (abs (- new old)) tolerance))
  (define tolerance 0.0001)
  (iter start (fun start)))




