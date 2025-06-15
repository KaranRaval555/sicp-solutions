#lang sicp
(#%require racket/trace)


(define zero
  (lambda (f)
    (lambda (x) x)))
(define one
  (lambda (f)
    (lambda (x) (f x))))
(define two
  (lambda (f)
    (lambda (x) (f (f x)))))
((zero inc) 0)
((one inc) 0)
((two inc) 0)
