#lang sicp

(define (union-set a b)
  (cond
    ((null? a) b)
    ((element-of-set? (car a) b) (union-set (cdr a) b))
    (else (cons (car a) (union-set (cdr a) b)))))
(union-set '(1 2 3 4 5) '(2 94 29 4 23 3))
