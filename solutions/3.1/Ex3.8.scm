#lang sicp

(define f
  ((lambda (prev)
    (lambda (curr)
      (let ((temp prev))
        (set! prev curr)
        temp))) 0))

(+ (f 0) (f 1))
(+ (f 1) (f 0))
