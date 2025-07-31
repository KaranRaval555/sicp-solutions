#lang sicp

(define (make-account balance pass)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance
                     (- balance amount))
               balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (dispatch input-pass m)
    (if (eq? input-pass pass)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request: 
                 MAKE-ACCOUNT" m)))
         (lambda (_) "Incorrect password")))
  dispatch)

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
