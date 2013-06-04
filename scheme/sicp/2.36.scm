(define (accumulate op init seq)
  (if (null? seq)
    init
    (op (car seq)
	(accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (head seqs))
	  (accumulate-n op init (tail seqs)))))

(define (head seqs)
  (if (null? seqs)
    '()
    (cons (caar seqs)
	  (head (cdr seqs)))))

(define (tail seqs)
  (if (null? seqs)
    '()
    (cons (cdar seqs)
	  (tail (cdr seqs)))))
