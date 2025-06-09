#lang sicp
(#%require racket/trace)

(define (append a b)
  (if (null? a) b
    (cons (car a) (append (cdr a) b))))

(define (reverse l)
  (if (null? l) '()
    (append (reverse (cdr l)) (list (car l)))))
(trace reverse)
(reverse (list 1 4 9 16 25))

