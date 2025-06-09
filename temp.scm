#lang sicp
(#%require racket/trace)

(define (list-ref items n)
  (if (= n 0) (car items)
    (list-ref (cdr items) (- n 1))))
(define squares 
  (list 1 4 9 16 25))

; (define (length items)
;   (if (null? items) 0
;     (inc (length (cdr items)))))
(define (length items)
  (define (iter items n)
    (if (null? items) n
      (iter (cdr items) (inc n))))
  (iter items 0))
(define odds
  (list 1 3 5 7))
(length odds)

(define (append a b)
  (if (null? a) b
    (cons (car a) (append (cdr a) b))))
(append squares odds)
(append odds squares)

(define (factor n) ())
(define (square x) (* x x))
(define (map proc items)
        (if (null? items) nil
          (cons (proc (car items)) (map proc (cdr items)))))
(map square '(1 2 3 4 5 6 7 8 9 10))
