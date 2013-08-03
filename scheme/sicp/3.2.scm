(define (make-monitored fun)
  (let ((count 0))
    (lambda (cmd)
      (cond ((eq? cmd 'how-many-calls?) count)
	    ((eq? cmd 'reset-count) (set! count 0))
	    (else
	      (begin (set! count (+ count 1))
		     (fun cmd)))))))

(define (make-monitored1 fun)
  (let ((count 0))
    (define (dispatch cmd)
      (cond ((eq? cmd 'how-many-calls?) count)
	    ((eq? cmd 'reset-count) (set! count 0))
	    (else
	      (begin (set! count (+ count 1))
		     (fun cmd)))))
    dispatch))



