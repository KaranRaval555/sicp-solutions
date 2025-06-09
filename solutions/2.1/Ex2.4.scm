#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define pair (cons 3 4))
(car pair)
(cdr pair)
; Using substitution model
; (lambda (m) (m 3 4))
; (car pair)
; (pair (lambda (p q) p))
; ((lambda (m) (m 3 4)) (lambda (p q) p))
; ((lambda (p q) p) 3 4)
; 3
; (cdr pair)
; (pair (lambda (p q) q))
; ((lambda (m) (m 3 4)) (lambda (p q) q))
; ((lambda (p q) q) 3 4)
; 4


