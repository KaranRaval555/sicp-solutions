#lang sicp

(define (sq x) (* x x))

(define (map proc items)
  (if (null? items) nil
    (cons (proc (car items)) (map proc (cdr items)))))

(define (square-tree tree)
  (cond
    ((null? tree) nil)
    ((not (pair? tree)) (sq tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
           (sq sub-tree)
           (square-tree sub-tree)))
       tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
