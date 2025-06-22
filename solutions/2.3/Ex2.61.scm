#lang sicp

(define (adjoin-set x set)
  (cond
    ((null? set) '())
    ((< x (car set)) (cons x set))
    (else (cons (car set) (adjoin-set x (cdr set))))))
(adjoin-set 2 '(1 3))
