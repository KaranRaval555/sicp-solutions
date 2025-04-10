#lang sicp

(define (f g) (g 2))
(trace f)
(f f)
; (f 2)
; (2 2)
; it will throw an error since 2 is not a function,
; f can only be applied to procedure
