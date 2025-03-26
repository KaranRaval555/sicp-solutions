#lang sicp
(define (square x) (* x x))
(define (cube x) (* x x x))
(define fun
  (lambda(x y f)
    (if (> x y) 0
      (+ (f x) (fun (+ x 1) y f)))))
;(fun 3 5 cube)
(define fact-iter
  (lambda (n counter product)
    (if (> counter n) product
      (fact-iter n (+ counter 1) (* counter product)))))
(fact-iter 5 1 1)
