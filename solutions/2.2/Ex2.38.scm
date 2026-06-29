#lang sicp

(define (foldr op initial sequence)
  (if (null? sequence) initial
    (op (car sequence) (foldr op initial (cdr sequence)))))

(define (foldl op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


(foldr / 1 (list 1 2 3))
(foldl  / 1 (list 1 2 3))
(foldr cons nil (list 1 2 3))
(foldl  cons nil (list 1 2 3))

; For foldl and foldr to produce the same value on any sequence, op must satisfy the following two properties:
; Commutative: (= (op x y) (op y x))
; Associative: (= (op x (op y z)) (op (op x y) z))


