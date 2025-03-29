#lang sicp
(#%require racket/trace)
(define (f g) (g 2))
(trace f)
(f f)
; (f 2)
; (2 2)
; it will throw an error since, f can only be applied to procedure