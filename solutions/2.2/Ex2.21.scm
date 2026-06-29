#lang sicp

(define (square x) (* x x))

(define (map fn items)
        (if (null? items) nil
          (cons (fn (car items)) (map fn (cdr items)))))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list items) (map square items))

(square-list (list 1 2 3 4))
