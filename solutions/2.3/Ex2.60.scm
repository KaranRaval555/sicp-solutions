#lang sicp

; Same
(define (element-of-set? x set)
  (cond
    ((null? set) false)
    ((equal? x (car set)) true)
    (else (element-of-set? x (cdr set)))))

; No need to check element-of-set?
(define (adjoin-set x set) (cons x set))

; Same
(define (intersection-set a b)
  (cond
    ((or (null? a) (null? b)) '())
    ((element-of-set? (car a) b)
     (cons (car a) (intersection-set (cdr a) b)))
     (else (intersection-set (cdr a) b))))

; No need to check element-of-set?
(define (union-set a b)
  (append a b))
