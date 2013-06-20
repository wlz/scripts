(define (tree-map proc tree)
  (cond ((null? tree) '())
	((pair? tree)
	 (cons (tree-map proc (car tree))
	       (tree-map proc (cdr tree))))
	(else
	  (proc tree)))) 

(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else 
	  (cons (square-tree (car tree))
		(square-tree (cdr tree))))))

(define (square-map tree)
  (tree-map square tree))

(define (square x)
  (* x x)) 
