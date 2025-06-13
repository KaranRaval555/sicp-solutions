#lang sicp

(define (append l1 l2)
  (if (null? l1) l2
    (cons (car l1) (append (cdr l1) l2))))

(define (fringe x)
  (cond
    ((null? x) x)
    ((not (list? x)) (list x))
    (else (append (fringe (car x)) (fringe (cdr x))))))

(define x
  (list (list 1 2) (list 3 4)))
(fringe x)
