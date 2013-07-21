(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

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

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< (weight x) (weight (car set)))
	 (cons x set))
	(else (cons (car set)
		    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
		  (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge ordered-leafs)
  (if (= (length ordered-leafs) 1)
    (car ordered-leafs)
    (successive-merge (adjoin-set 
			(make-code-tree (car ordered-leafs) 
					(cadr ordered-leafs))
			(cddr ordered-leafs)))))

(define song-symbols '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM)) 

(define sample-pairs 
  '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9)))

(define sample-leafs
  (make-leaf-set sample-pairs))

(define sample-huffman-tree
  (generate-huffman-tree sample-pairs)) 

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
	    (encode (cdr message) tree))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (encode-symbol symbol tree)
  (define (iter symbol result current-branch)
    (if (leaf? current-branch)
      result
      (if (element-of-set? symbol (symbols (left-branch current-branch)))
	(iter symbol (append result (list 0)) (left-branch current-branch))
	(iter symbol (append result (list 1)) (right-branch current-branch)))))
  (iter symbol '() tree))

(define (element-of-set? element set)
  (if (null? set)
    #f
    (if (eq? (car set) element)
      #t
      (element-of-set? element (cdr set)))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch
	      (choose-branch 
		(car bits) current-branch)))
	(if (leaf? next-branch)
	  (cons (symbol-leaf next-branch)
		(decode-1 (cdr bits) tree))
	  (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (if (= bit 0)
    (left-branch branch)
    (right-branch branch))) 
