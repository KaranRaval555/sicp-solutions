#lang racket

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter 
           a
           b
           (+ (* p p) (* q q))
           (+ (* 2 p q) (* q q))
           (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

; Applying transformation T(p, q) to (a, b):
; a' = bq + aq + ap
; b' = bp + aq

; Applying it again:
; a'' = bq' + aq' + ap'
; b'' = bp' + aq'

; Substituting a' and b':
; a'' = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;     = bpq + aqq + bqq + aqq + apq + bqp + aqp + app
;     = b(2pq + q²) + a(2pq + q²) + a(p² + q²)
; b'' = (bp + aq)p + (bq + aq + ap)q
;     = bpp + aqp + bqq + aqq + apq
;     = b(p² + q²) + a(2pq + q²)

; Matching with T(p', q'):
; p' = p² + q²
; q' = 2pq + q²
