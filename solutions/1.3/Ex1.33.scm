#lang sicp

(define (filtered-accumulate a b combiner predicate? term next null-value)
  (if (> a b) null-value
      (combiner (if (predicate? a) (term a) null-value) (filtered-accumulate (next a) b combiner predicate? term next null-value))))
(define (sq x) (* x x))
(filtered-accumulate 1 10 + prime? sq inc 0)
(define (gcd a b)
  (if (= b 0) a
      (gcd b (remainder a b))))
(define (identity x) x)
(define (product-rel-prime n)
  (define (rel-prime i)
    (= (gcd i n) 1))
  (filtered-accumulate 1 n * rel-prime identity inc 1))
(product-rel-prime 10)