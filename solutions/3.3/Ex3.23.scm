#lang sicp

; I have implemented the deque as a doubly-linked list. This uses a three-part structure cdr of each item is a pair whose car points to the previous item and whose cdr points to the next.

; Constructor
(define (make-node val prev next)
  (list val prev next))

; Selctors
(define (val-node node) (car node))
(define (prev-node node) (cadr node))
(define (next-node node) (caddr node))

; Mutators
(define (set-val-node! node x)
  (set-car! node x))
(define (set-prev-node! node x)
  (set-car! (cdr node) x))
(define (set-next-node! node x)
  (set-car! (cddr node) x))

; Doubly-linked-list
(define (make-deque)
  (let ((front-ptr '())
        (rear-ptr '()))

    (define (empty-deque?)
      (or (null? front-ptr) (null? rear-ptr)))

    (define (front-deque)
      (if (empty-deque?)
        (error "FRONT called with an empty deque")
        (car front-ptr)))

    (define (rear-deque)
      (if (empty-deque?)
        (error "REAR called with an empty deque")
        (car rear-ptr)))

    (define (set-front-ptr! i)
      (set! front-ptr i))

    (define (set-rear-ptr! i)
      (set! rear-ptr i))

    (define (front-insert-deque! i)
      (let ((new-node (make-node i '() '())))
        (cond ((empty-deque?)
               (set-front-ptr! new-node)
               (set-rear-ptr! new-node))
              (else
                (set-next-node! new-node front-ptr)
                (set-prev-node! front-ptr new-node)
                (set-front-ptr! new-node)))))

    (define (rear-insert-deque! i)
      (let ((new-node (make-node i '() '())))
        (cond ((empty-deque?)
               (set-front-ptr! new-node)
               (set-rear-ptr! new-node))
              (else
                (set-prev-node! new-node rear-ptr)
                (set-next-node! rear-ptr new-node)
                (set-rear-ptr! new-node)))))

    (define (front-delete-deque!)
      (cond ((empty-deque?)
             (error "FRONT-DELETE! called with an empty deque"))
            ((null? (next-node front-ptr))
             (set-front-ptr! '()))
            (else
              (set-front-ptr! (next-node front-ptr))
              (set-prev-node! front-ptr '()))))

    (define (rear-delete-deque!)
      (cond ((empty-deque?)
             (error "REAR-DELETE! called with an empty deque"))
            (else
              (set-rear-ptr! (prev-node rear-ptr))
              (set-next-node! rear-ptr '()))))

    (define (dispatch m)
      (cond ((eq? m 'front-insert-deque!) front-insert-deque!)
            ((eq? m 'rear-insert-deque!) rear-insert-deque!)
            ((eq? m 'front-delete-deque!) (front-delete-deque!))
            ((eq? m 'rear-delete-deque!) rear-delete-deque!)
            ((eq? m 'front-deque) (front-deque))
            ((eq? m 'rear-deque) (rear-deque))
            ((eq? m 'front-ptr) front-ptr)
            (else
              (error "UNKNOWN METHOD -- make-deque"))))
    dispatch))
