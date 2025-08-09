#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence) initial
    (op (car sequence) (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(fold-right / 1 (list 1 2 3))
(fold-left  / 1 (list 1 2 3))
(fold-right cons nil (list 1 2 3))
(fold-left  cons nil (list 1 2 3))

; For fold-left and fold-right to produce the same value on any sequence, op must satisfy the following two properties:
; Commutative: (= (op x y) (op y x))
; Associative: (= (op x (op y z)) (op (op x y) z))


