#lang sicp

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 1/2))
(define in-coins (list 1 2 5 10 20))

(define (cc amount coins)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((no-more? coins) 0)
        (else
         (+ (cc amount
                (except-first-denom coins))
            (cc (- amount (first-denom coins))
                coins)))))

(define first-denom car)
(define except-first-denom cdr)
(define no-more? null?)

(cc 20 uk-coins)
(cc 100 in-coins)

; The order of the coin list does not affect the answer produced by cc:

(cc 100 us-coins) 
(cc 100 (reverse us-coins))
(cc 100 (list 5 50 1 25 10))

; The order is irrelevant as long as all the coin values are in the list.
