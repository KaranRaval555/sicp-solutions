#lang sicp

(define x 10)

(parallel-execute
 (lambda () (set! x (* x x)))
 (lambda () (set! x (* x x x))))

(define x 10)

(define s (make-serializer))
(parallel-execute
 (s (lambda () (set! x (* x x))))
 (s (lambda () (set! x (* x x x)))))

100
1000

1000
100
