(define (make-account password balance)
  (let ((pwds (list password)))
    (define (withdraw amount)
      (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds"))
    (define (deposit amount)
      (begin (set! balance (+ balance amount))
	     balance))
    (define (addpwd newpwd)
      (set! pwds (append pwds (list newpwd))))
    (define (dispatch pwd m)
      (if (not (element-of-set? pwd pwds))
	(lambda (x) "wrong password")
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      ((eq? m 'addpwd) addpwd)
	      (else
		(lambda (x) "Unknown request")))))
    dispatch))

(define (element-of-set? element set)
  (if (null? set)
    #f
    (if (eq? (car set) element)
      #t
      (element-of-set? element (cdr set)))))

(define peter-acc (make-account 'pwd 100))

(define (make-joint account pwd newpwd)
  (begin ((account pwd 'addpwd) newpwd)
	 account))
