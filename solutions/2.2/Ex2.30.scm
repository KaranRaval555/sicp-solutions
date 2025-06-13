#lang sicp

(define (sq x) (* x x))
(define (map proc items)
  (if (null? items) nil
    (cons (proc (car items)) (map proc (cdr items)))))

(define (square-tree tree)
  (cond
    ((null? tree) nil)
    ((not (pair? tree)) (square tree))
    (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree sub-tree)
           (sq (sub-tree))))
       tree))

