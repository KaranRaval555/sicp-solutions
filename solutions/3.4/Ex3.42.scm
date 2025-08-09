#lang sicp

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (let ((protected (make-serializer)))
    (let ((protected-withdraw
           (protected withdraw))
          (protected-deposit 
           (protected deposit)))
      (define (dispatch m)
        (cond ((eq? m 'withdraw)
               protected-withdraw)
              ((eq? m 'deposit)
               protected-deposit)
              ((eq? m 'balance)
               balance)
              (else 
               (error "Unknown request: 
                       MAKE-ACCOUNT"
                      m))))
      dispatch)))

; This is a safe change to make. Each bank account still has one serializer and the deposit and withdraw procedures returned from the dispatcher are always protected by it. It makes no difference in what concurrency is allowed. The let expression will create extra frame in environment model but other than that they are the same.
