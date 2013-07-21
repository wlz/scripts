(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
		  (make-leaf-set (cdr pairs))))))

(define (successive-merge leafs)
  (if (= (length leafs) 1)
    (car leafs)
    (successive-merge (adjoin-set (make-code-tree (car leafs) (cadr leafs))
				  (cddr leafs)))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set)))
	 (cons x set))
	(else
	  (cons (car set) (adjoin-set x (cdr set))))))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left)
		(symbols right))
	(+ (weight left)
	   (weight right))))

(define sample-pairs '((A 4) (B 2) (D 1) (C 1)))

(define huffman-tree (generate-huffman-tree sample-pairs))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree)) 

(define (encode-symbol symbol tree)
  (define (iter symbol result current-branch)
    (cond ((leaf? current-branch) result)
	  ((element-of-set? symbol (symbols (left-branch current-branch)))
	   (iter symbol (append result (list 0)) (left-branch current-branch)))
	  (else
	    (iter symbol (append result (list 1)) (right-branch current-branch)))))
  (iter symbol '() tree))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((eq? (car set) x) #t)
	(else
	  (element-of-set? x (cdr set)))))

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
  (if (= bit 0)
    (left-branch tree)
    (right-branch tree))) 
