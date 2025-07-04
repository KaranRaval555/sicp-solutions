#lang sicp

(define f
  ((lambda(old)
     (lambda(x)
       (let ((temp old))
         (set! old x) temp))) 0))
(+ (f 0) (f 1))
(+ (f 1) (f 0))
