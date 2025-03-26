#lang sicp
(#%require racket/trace)
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
(A 1 10)
(A 2 4)
(A 3 3)
;; f is 2n
;; g is 2^n
;; h is a tetration or repeated exponentiation n - 1 times
;; k is 5n^2
