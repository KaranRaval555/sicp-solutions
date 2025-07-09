#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty-queue?)
      (null? front-ptr))

    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue")
          (car front-ptr)))

    (define (set-front-ptr! index)
      (set! front-ptr index))

    (define (set-rear-ptr! index)
      (set! rear-ptr index))

    (define (insert-queue! index)
      (define new-pair (cons index '()))
      (cond ((empty-queue?)
             (set-front-ptr! new-pair)
             (set-rear-ptr! new-pair)
             (cons front-ptr rear-ptr))
            (else
             (set-cdr! rear-ptr new-pair)
             (set-rear-ptr! new-pair)
             (cons front-ptr rear-ptr))))

    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue"))
            (else
             (set-front-ptr! (cdr front-ptr))
             (cons front-ptr rear-ptr))))

    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'delete-queue!) delete-queue!)
            (else
             (error "UNKNOWN METHOD -- make-queue"))))
    dispatch))

(define (insert-queue! q index) ((q 'insert-queue!) index))
(define (delete-queue! q) ((q 'delete-queue!)))
(define q1 (make-queue))
(insert-queue! q1 'a)
(insert-queue! q1 'b)
(insert-queue! q1 'c)
(delete-queue! q1)
(delete-queue! q1)
(delete-queue! q1)
