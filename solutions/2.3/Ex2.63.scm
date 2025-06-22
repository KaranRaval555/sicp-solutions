#lang sicp

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
       (append (tree->list-1 (left-branch tree))
	       (cons (entry tree)
		     (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list
			     (right-branch tree)
			     result-list)))))
  (copy-to-list tree '()))

(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ()))))
(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ())))))
(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ()))))

(tree->list-1 tree1) ; '(1 3 5 7 9 11)
(tree->list-2 tree1) ; '(1 3 5 7 9 11)

(tree->list-1 tree2) ; '(1 3 5 7 9 11)
(tree->list-2 tree2) ; '(1 3 5 7 9 11)

(tree->list-1 tree3) ; '(1 3 5 7 9 11)
(tree->list-2 tree3) ; '(1 3 5 7 9 11)

; 1.
; The two procedures produce the same result for every tree
; The first performs an in-order traversal and appends intermediate results (left to right), while the second performs a reverse in-order traversal and prepends elements to the result (right to left).

; 2.
; The first procedure does linear work at each node, so it grows as Θ(nlogn) for a balanced tree. The second procedure does constant work at each node, so it grows as Θ(n) for any tree whether balanced or not. The second procedure is more efficient.
