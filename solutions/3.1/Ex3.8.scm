#lang sicp

(define f
  (let ((x 0))
    (lambda (y)
      (let ((old-x x))
        (set! x y)
        old-x))))

(let ((result (+ (f 0) (f 1))))
  (or (= result 0) (= result 1)))
