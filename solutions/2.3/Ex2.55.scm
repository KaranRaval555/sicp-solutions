#lang sicp

(car ''abracadabra)

; The above expression is same as :
(car (quote (quote abracadabra)))
(car '(quote abracadabra))
; which is clearly a compound data object containing quote function as its first element
