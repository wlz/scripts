(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
    (begin (set! balance (- balance amount))
	   balance)
    "Insufficient funds"))

(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))))

(define (new-withdraw2 amount)
  (let ((balance 100))
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds")))

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds")))

(define W1 (make-withdraw 100))

(define W2 (make-withdraw 100))

