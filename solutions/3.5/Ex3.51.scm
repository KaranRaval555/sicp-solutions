#lang sicp

(define (show x)
  (display-line x)
  x)
(define z 
  (stream-filter
    (lambda (x) 
      (= (remainder x 5) 0)) seq))

(stream-ref x 5)
(stream-ref x 7)
