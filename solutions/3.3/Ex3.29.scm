#lang sicp

(define (or-gate a b out)
  (let ((na (make-wire))
        (nb (make-wire))
        (c (make-wire)))
    (inverter a na)
    (inverter b nb)
    (and-gate na nb c)
    (inverter c out)))

(define compound-or-gate-delay
  (+ and-gate-delay (* 2 inverter-delay)))
