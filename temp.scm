#lang sicp
(#%require racket/trace)

(define (square x) (* x x))
(define (make-from-real-imag x y)
  (define (dispatch op) ; message handler
    (cond ((eq? op 'real-part) x)
          ((eq? op 'imag-part) y)
          ((eq? op 'magnitude)
           (sqrt (+ (square x) (square y))))
          ((eq? op 'angle) (atan y x))
          (else
           (error "Unknown op: 
            MAKE-FROM-REAL-IMAG" op))))
  dispatch)
(define z (make-from-real-imag 3 4)) ; Object
(z 'real-part) ; message/method-name
