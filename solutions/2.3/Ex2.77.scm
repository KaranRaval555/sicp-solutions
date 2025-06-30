#lang sicp

(define (complex-components-pkg)
  (put 'real-part '(complex) real-part)
  (put 'imag-part '(complex) imag-part)
  (put 'magnitude '(complex) magnitude)
  (put 'angle '(complex) angle))
; This works because these selectors were defined in § 2.4.3 using apply-generic, so now they will dispatch back to themselves when given a data object tagged 'complex. In other words, we are telling the system to strip off the type tag and try again
