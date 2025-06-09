#lang sicp

(define (same-parity a . rest)
    (if (odd? a) (get-odd (cons a rest)) (get-even (cons a rest))))
(define (get-odd l)
  (cond
    ((null? l) '())
    ((odd? (car l)) (cons (car l) (get-odd (cdr l))))
    (else (get-odd (cdr l)))))
(define (get-even l)
  (cond
    ((null? l) '())
    ((even? (car l)) (cons (car l) (get-even (cdr l))))
    (else (get-even (cdr l)))))
(same-parity 2 3 4 5 6 7)
(same-parity 1 2 3 4 5 6 7)
