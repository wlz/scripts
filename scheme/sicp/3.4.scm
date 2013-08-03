(define (make-account password balance)
  (let ((wrong-count 0))
    (define (withdraw amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount)))
    (define (call-the-cops amount)
      "call the cops")
    (define (dispatch pwd m) 
      (if (not (eq? pwd password))
	;(lambda (amount) "wrong password")
	(if (>= wrong-count 7)
	  call-the-cops
	  (begin (set! wrong-count (+ wrong-count 1))
		 (lambda (amount) "wrong password")))
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else
		(lambda (amount) "unknown method")))))
    dispatch))

(define acc (make-account '111 100))


