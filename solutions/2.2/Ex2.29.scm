#lang sicp

(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
(define left-branch car)
(define right-branch cdr)
(define branch-length car)
(define branch-structure cdr)

(define (total-weight mobile)
  (cond
    ((null? mobile) 0)
    ((not (list? (left-branch mobile))) (left-branch mobile))
    (else (+ (total-weight (left-branch mobile)) (total-weight (right-branch mobile))))))

