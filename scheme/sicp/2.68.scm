(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left)
		(symbols right))
	(+ (weight left)
	   (weight right))))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 symbol current-branch bits)
    (if (leaf? current-branch)
      bits
      (if (go-left? symbol current-branch) 
	(encode-1 symbol (left-branch current-branch) (append bits '(0)))
	(encode-1 symbol (right-branch current-branch) (append bits '(1))))))
  (encode-1 symbol tree '()))

(define (go-left? symbol tree)
  (elememt-of-set? symbol (symbols (left-branch tree))))

(define (elememt-of-set? x set)
  (cond ((null? set) #f)
	((eq? x (car set)) #t)
	(else (elememt-of-set? x (cdr set)))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
	(if (leaf? next-branch)
	  (cons (symbol-leaf next-branch) (decode-1 (cdr bits) tree))
	  (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit tree)
  (cond ((= bit 1) (right-branch tree))
	((= bit 0) (left-branch tree))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
		  (make-code-tree (make-leaf 'B 2)
				  (make-code-tree (make-leaf 'D 1)
						  (make-leaf 'C 1)))))

