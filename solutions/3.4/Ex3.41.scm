#lang sicp

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin 
          (set! balance 
                (- balance amount))
          balance)
        "Insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (let ((protected (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) 
             (protected withdraw))
            ((eq? m 'deposit) 
             (protected deposit))
            ((eq? m 'balance)
             ((protected 
                (lambda () 
                  balance)))) ; serialized
            (else 
             (error 
              "Unknown request: 
               MAKE-ACCOUNT"
              m))))
    dispatch))

; Ben Bitdiddle is wrong. It is unnecessary to serialize access to the bank balance because it would make no difference. If we serialize it, then the value will be read either before or after (in sequence) it is written, assuming someone is withdrawing or depositing concurrently. However, if we don’t serialize it, we still get one value or the other. There is nothing that can be interleaved because reading the balance takes only one step, assuming the Scheme implementation considers this a thread-safe operation.

; An example of where serialising reads would be necessary is a database transaction log, where the reading of values needs to be consistent and repeatable, by replaying the transactions after a crash. It still very much depends on the needs of the applications though, as non-serialised or “dirty” reads are still common with databases.
