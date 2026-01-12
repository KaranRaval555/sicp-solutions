#lang sicp

(define (make-account balance pass)
  (let ((count 0))

  (define (withdraw amount)
    (if (>= balance amount)
        (begin
          (set! balance (- balance amount))
          (set! count 0)
               balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    (set! count 0)
    balance)

  (define (dispatch input-pass m)
    (cond
          ((> count 7) (lambda (_) "Internal Error: Transanction Failed"))
          ((not (eq? input-pass pass)) (lambda (_) (begin (set! count (+ count 1)) "Incorrect password")))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request:
                 MAKE-ACCOUNT" m))))
  dispatch))

(define acc (make-account 100 'secret-password))
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'secret-password 'withdraw) 40)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
