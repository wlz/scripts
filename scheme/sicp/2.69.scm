(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs))) 

(define (successive-merge ordered-leafs)
  (if (= (length ordered-leafs) 1) 
    ordered-leafs 
    (successive-merge (adjoin-set (make-code-tree (car ordered-leafs)
						  (cadr ordered-leafs))
				  (cddr ordered-leafs)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set)))
	 (cons x set))
	(else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair)
			     (cadr pair))
		  (make-leaf-set (cdr pairs))))))

(define (make-code-tree left right)
  (list left
	right
	(append (symbols left) (symbols right))
	(+ (weight left) (weight right))))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

;(define sample-pairs '((A 2) (G 3) (B 4) (E 8) (F 12) (D 1) (C 1)))
(define sample-pairs '((A 4) (B 2) (C 1) (D 1)))

