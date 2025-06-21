#lang sicp

(define (combine set1 set2)
  (if (null? set2) set1
    (cons (car set2) (combine set1 (cdr set2)))))

(define (makeset li)
  (cond
    ((null? li) '())
    ((element-of-set? (car li) (cdr li)) (makeset (cdr li)))
    (else (cons (car li) (makeset (cdr li))))))

(define (union-set set1 set2)
  (cond
    ((null? set1) set2)
    ((element-of-set? (car set1) set2)
     (union-set (cdr set1) set2))
    (else (cons (car set1) (union-set (cdr set1) set2)))))
;              OR
(define (union-set set1 set2)
  (makeset (combine set1 set2)))
(union-set '(1 2 3 4 5) '(2 94 29 4 23 3))
