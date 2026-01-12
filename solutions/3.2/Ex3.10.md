The let-syntax is replaced with the equivalent lambda-construct:

```scheme
(define (make-withdraw initial-amount)
  ((lambda (balance)
     (lambda (amount)
       (if (>= balance amount)
         (begin (set! balance
                  (- balance amount))
                balance)
         "Insufficient funds")))
   initial-amount))
```

After executing the above definition in the global environment:
global env -> make-withdraw:
parameters: initial-amount

body:
```scheme
(lambda (amount)
  (if (>= initial-amount amount)
    (begin (set! initial-amount (- initial-amount amount))
           initial-amount)
    "Insufficient funds"))
```

After this, the other diagrams will be exactly like figures 3.7 - 3.10 in the book,
except balance is replaced with initial-amount. So, objects defined with let-syntax
behave the same.

With or without the explicit state variable, 
`make-withdraw` creates objects with the same behaviour.
The only difference with the explicit variable in the let-form is that 
there is an extra environment. 
Applying `make-withdraw` creates E1 to bind 100 to `initial-amount`, and 
then the let-form desugars to a lambda application, creating a new environment E2.
This environment holds `balance`, beginning with the same value as `initial amount`. 
When we evaluate `(W1 20)`, we create the environment E3 that binds `amount` to 20.
