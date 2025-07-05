#lang sicp

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define x (list 'a 'b))
(define y (list 'c 'd))
(define z (append x y))

z
(cdr x) ; (b)
; x->[*|*]->[*|X]
;     |      |
;     V      V
;     a      b
(define w (append! x y))
w
(cdr x) ; (b c d)
;                 y
;                 |
; x->[*|*]->[*|*]->[*|*]->[*|X]
; w/  |      |      |      |
;     V      V      V      V
;     a      b      c      d
