#lang sicp

(define (square x) (* x x))

(define (map proc items)
        (if (null? items) nil
          (cons (proc (car items)) (map proc (cdr items)))))

(define (tree-map proc tree)
  (map (lambda (sub-tree)
       (if (not (pair? sub-tree)) (proc sub-tree)
         (tree-map proc sub-tree)))
       tree))

(define (square-tree tree) 
  (tree-map square tree))
(define t (list 1 (list 2 (list 3 4) 5) (list 6 7)))
t
(square-tree t)

