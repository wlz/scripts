(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define zero
  (lambda (f)
    (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define three
  (lambda (f)
    (lambda (x)
      (f (f (f x))))))

(define four
  (lambda (f)
    (lambda (x)
      (f (f (f (f x)))))))

(define five
  (lambda (f)
    (lambda (x)
      (f (f (f (f (f x))))))))

(define six
  (lambda (f)
    (lambda (x)
      (f (f (f (f (f (f x)))))))))

(define seven
  (lambda (f)
    (lambda (x)
      (f (f (f (f (f (f (f x))))))))))


((three (lambda (x) (+ x 1))) 1)

(define three
  (lambda (f)
    (lambda (x) (f (f (f x))))))

((three (lambda (x) (+ x 1))) 1)

(lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f)
    (lambda (x) (f x))))

(define (one1 f)
  (define (method x)
    (f x))
  method)

(define (two1 f)
  (define (method x)
    (f (f x)))
  method)

(define (three1 f)
  (define (method x)
    (f (f (f x))))
  method)

(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

(define (add-1 n)
  (lambda (f)
    (lambda (x) (f ((n f) x)))))

;; input n
;; output lambda (f)

(define (add-2 n)
  (define (method f)
    (define (func x)
      (f ((n f) x)))
    func)
  method)
    
