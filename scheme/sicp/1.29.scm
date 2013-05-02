(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (add x) (+ x (* 2 h)))
  (+ (* (/ h 3) (f a))
     (* (/ (* 4 h) 3) (sum f (+ a h) add b))
     (* (/ (* 2 h) 3) (sum f (+ a (* h 2)) add b))))

(define (cube x)
  (* x x x))

(define (squre x)
  (* x x))
     
	
