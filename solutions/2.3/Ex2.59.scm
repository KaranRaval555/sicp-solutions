#lang sicp

(define (combine a b)
  (if (null? b) a
    (cons (car b) (combine a (cdr b)))))

(define (makeset li)
  (cond
    ((null? li) '())
    ((element-of-set? (car li) (cdr li)) (makeset (cdr li)))
    (else (cons (car li) (makeset (cdr li))))))

(define (union-set a b)
  (cond
    ((null? a) b)
    ((element-of-set? (car a) b) (union-set (cdr a) b))
    (else (cons (car a) (union-set (cdr a) b)))))
;              OR
(define (union-set a b)
  (makeset (combine a b)))
(union-set '(1 2 3 4 5) '(2 94 29 4 23 3))
