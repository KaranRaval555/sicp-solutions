#lang sicp

; As Eva Lu Ator correctly explains, the fundamental issue is that the Scheme interpreter prints out the entire queue structure which is the front-ptr and the rear-ptr. The front-ptr is printed as the entire list (the data that would generally be considered the queue itself) and then the rear-ptr is printed as the final element of the queue, which is why you seemingly get the final element twice.
;

(define (print-queue q)
  (car q))
