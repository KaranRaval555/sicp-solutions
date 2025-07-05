#lang sicp
(#%require racket/trace)

(define a (cons 1 2))
(define b (cons a a))
(set-car! (car b) 3)
(car a)
(car b)
(cdr b)
a
b
(get-new-pair)
