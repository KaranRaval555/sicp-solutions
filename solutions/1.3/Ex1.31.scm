#lang sicp

;; Recursive process
;; (define (product a b term next)
;;   (if (> a b)
;;       1
;;       (* (term a) (product (next a) b term next))))

;; Iterative process
(define (product a b term next res)
  (define (iter a res)
    (if (> a b)
      res
      (iter (next a) (* res (term a)))))
  (iter a 1))

(define (fact n)
  (product 1 n (lambda (x) x) inc 1))
(define (approx x)
  (product 1.0 x (lambda (n) (* (/ 1.0 2) (/ (* 2 n) (- (* 2 n) 1)) (/ (* 2 n) (+ (* 2 n) 1)))) inc 1))
(* 4 (approx 1))
