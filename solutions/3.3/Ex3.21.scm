#lang sicp


(define q1 (make-queue))

(insert-queue! q1 'a)
; ((a) a)

(insert-queue! q1 'b)
; ((a b) b)

(delete-queue! q1)
; ((b) b)

(delete-queue! q1)
; (() b)

; As Eva Lu Ator correctly explains, the fundamental issue is that the Scheme interpreter prints out the entire queue structure which is the front-ptr and the rear-ptr. 
; The front-ptr is printed as the entire list (the data that would generally be considered the queue itself) and then the rear-ptr is printed as the final element of the queue, which is why you seemingly get the final element twice.
; So the front pointer essentially grows as a list to represent queue
; and the back pointer just pointer to the last item and used for inserting items
; so the print-queue should just print front-ptr

(define (print-queue q)
  (front-ptr q))
