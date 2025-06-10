#lang sicp

(define (same-parity a . rest)
    (if (odd? a) (get-evens-or-odds odd? (cons a rest)) (get-evens-or-odds even? (cons a rest))))

(define (get-evens-or-odds pred? l)
  (cond
    ((null? l) '())
    ((pred? (car l)) (cons (car l) (get-evens-or-odds pred? (cdr l))))
    (else (get-evens-or-odds pred? (cdr l)))))
(same-parity 2 3 4 5 6 7)
(same-parity 1 2 3 4 5 6 7)
