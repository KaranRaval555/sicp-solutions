#lang sicp

(define (p) (p))
(define (test x y) 
  (if (= x 0) 
    0 
    y))

; (test 0 (p))
; test returns 0 when normal order is used
; test goes into infinite recursion when applicative order evaluation is used because
; applicative order evaluates its argument before the body of procedure gets executed and
; normal order doesn't evaluate the arguments until they are actually needed.
