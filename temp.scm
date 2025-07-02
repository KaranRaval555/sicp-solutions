#lang sicp
(#%require racket/trace)

; Closure : persistant local state variables
(define (make-count)
  (let ((result 0)) ; result is stored in closure
    (lambda () (set! result (+ result 1)) result)))
(define c1 (make-count))
(define c2 (make-count))
(c1)
(c2)
(c1)
(c2)
