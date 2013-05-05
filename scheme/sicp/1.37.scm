;; (define (cont-frac n d k)
;;   (define (cons n d count)
;;     (let ((index (+ (- k count) 1)))
;;       (if (< count 0)
;; 	  0
;; 	  (/ (n index)
;; 	     (+ (d index) (cons n d (- count 1)))))))
;;   (cons n d k))

(define (cont-frac n d k)
  (define (cons n d count)
    (let ((index (+ (- k count) 1)))
      (if (> count k)
	  0
	  (/ (n index)
	     (+ (d index) (cons n d (+ count 1)))))))
  (cons n d 1))
	  
	  
