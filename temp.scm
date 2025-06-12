#lang sicp

(define (atom? a) (not (list? a)))
(define (lat? l)
  (cond
    ((null? l) #t)
    ((not (atom? (car l))) #f)
    (else (lat? (cdr l)))))
(lat? '())
