#lang sicp
(#%require racket/trace)


(define (for-each proc terms)
  (cond ((not (null? terms))
         (proc (car terms))
         (for-each proc (cdr terms)))
        (else
          (newline))))
(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
