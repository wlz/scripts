;; (define plus
;;   (lambda(x) (+ x 1)))

(define (plus x)
  (+ x 1))

(define (f1 x y)
  (define (f-helper a b)
    (+ (* x (* a a))
       (* y b)
       (* a b)))
  (f-helper (+ 1 (* x y))
	    (- 1 y)))

(define (f2 x y)
  ((lambda(a b)
     (+ (* x (* a a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))

;; (define f3
;;   ((lambda (x) (* x x))
;;    2))

;; (define f3
;;   (lambda (x) (* x x)))

;; (define (f3 x)
;;   ((lambda (a) (+ a 3))
;;    (* x x)))

;; (define (f3 x y)
;;   (* ((lambda (a) (* a a)) x)
;;      ((lambda (b) (* b b b)) y)))

(define (f x y)
  (let ((a (+ 1 (* x y)))
	(b (- 1 y)))
    (+ (* x (* a a))
       (* y b)
       (* a b))))

(define (f x y)
  ((lambda (a b)
     (+ (* x (* a a))
	(* y b)
	(* a b)))
   (+ 1 (* x y))
   (- 1 y)))
