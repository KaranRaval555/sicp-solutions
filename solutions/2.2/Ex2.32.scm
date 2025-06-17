#lang sicp
(#%require racket/trace)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))
(trace subsets)
(subsets '(1 2 3))
