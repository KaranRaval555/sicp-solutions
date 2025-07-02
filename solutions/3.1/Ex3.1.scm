#lang sicp

(define (accumulator n)
  (lambda (x)
    (begin (set! n (+ x n)) n)))
(define A (accumulator 5))
(A 10)
(A 10)

