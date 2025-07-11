#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(count-pairs '(1 2 3))  ; 3
(define x (cons 1 '()))
(define y (cons x x))
(define z (cons y '()))
(count-pairs z)         ; 4

(define b (cons y y))
(count-pairs b)         ; 7

