#lang sicp

(define (square x) (* x x))
(define (divides? n a) (= (remainder n a) 0))
(define (next n) 
  (if (= 2 n) 
    3 
    (+ n 2)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? n test-divisor) test-divisor)
    (else (find-divisor n (next test-divisor)))))
(define (prime? n) (= n (smallest-divisor n)))
