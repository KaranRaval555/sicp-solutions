#lang sicp

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
(cadddr z) => 'a

; What happens if we try to compute (last-pair z)?
; This seems to be a circular linked list so the last element will point to the first element
; we will never finish because the list is not null-terminated and so null? will never be true. We will be stuck in an infinite recursion
;    +-------------------+
;    V                   |
; z->[*|*]->[*|*]->[*|*]-+
;     |      |      |
;     V      V      V
;     a      b      c
