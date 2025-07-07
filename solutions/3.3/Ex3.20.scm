#lang sicp
(#%require racket/trace)

(define (cons a b)
  (define (set-x! v) (set! a v))
  (define (set-y! v) (set! b v))
  (define (dispatch m)
    (cond ((eq? m 'car) a)
          ((eq? m 'cdr) b)
          ((eq? m 'set-car!) set-x!)
          ((eq? m 'set-cdr!) set-y!)
          (else (error "Undefined
                 operation: CONS" m))))
  dispatch)
(define (car z) (z 'car))
(define (cdr z) (z 'cdr))

(define (set-car! z new-value)
  ((z 'set-car!) new-value)
  z)

(define (set-cdr! z new-value)
  ((z 'set-cdr!) new-value)
  z)

(define x (cons 1 2))
(define z (cons x x))

(set-car! (cdr z) 17)
(car x)
