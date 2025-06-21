#lang sicp

(define (adjoin-set x set)
  (cond
    ((null? set) '())
    ((< x (car set)) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set))))))
(adjoin-set 1 '())
(adjoin-set 1 '(1))
(adjoin-set 2 '(1))
(adjoin-set 2 '(1 3))
