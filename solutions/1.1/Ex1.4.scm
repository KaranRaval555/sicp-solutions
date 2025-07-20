#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 5 -10)
; 15

(a-plus-abs-b -7 -12)
; 5

(a-plus-abs-b 3 36)
; 39
