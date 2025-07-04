#lang sicp
(#%require racket/trace)

; Closure : persistant local state variables
(define (make-counter result)
    (lambda () (set! result (+ result 1)) result))

(define c1 (make-counter 0))
(define c2 (make-counter 10))
(c1)
(c2)
(c1)
(c2)
