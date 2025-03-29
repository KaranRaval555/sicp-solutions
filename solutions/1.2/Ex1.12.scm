#lang sicp
(define (pascal n r) (/ (fact n) (* (fact (- n r)) (fact r))))
;(define (pascal r c)
 ; (if (or (= c 0) (= r c)) 1
  ;    (+ (pascal (- r 1) (- c 1)) (pascal (- r 1) c))))
(pascal 4 2)