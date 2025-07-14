#lang sicp

Peter: (set! balance (+ balance 10))
Paul:  (set! balance (- balance 20))
Mary:  (set! balance (- balance (/ balance 2)))

; List all the different possible values for balance after these three transactions have been completed, assuming that the banking system forces the three processes to run sequentially in some order.

balance = 100$
Peter deposits $10 
Paul withdraws $20
Mary withdraws half

scenario1 : Peter -> Paul -> Mary = 110 -> 90 -> 45

scenario2 : Peter -> Marry -> Paul = 110 -> 55 -> 35

scenario3 : Paul -> Marry -> Peter = 80 -> 40 -> 50

scenario4 : Paul -> Peter -> Mary = 80 -> 90 -> 45

scenario5 : Mary -> Peter -> Paul = 50 -> 60 -> 40

scenario6 : Mary -> Paul -> Peter = 50 -> 30 -> 40


; What are some other values that could be produced if the system allows the processes to be interleaved? Draw timing diagrams like the one in Figure 3.29 to explain how these values can occur. 

If the system allows the processes to be interleaved, you could also get results equivalent to leaving out one or more of the assignments, where the new value is overwritten before being read.

Lets take an example:

1. Peter lookup for the balance.

2. Paul lookup for the balance.

3. Paul deducts 20 and computes the remaining balance = 80

4. Mary reads the balance - which is still 100

5. Peter adds 10 and computes the balance - as per Peter balance is still 100 so Peter computes 100 + 10 = 110.

6. Mary computes the balance - as per Mary balance is 100 - so she computes 100/2 = 50.

7. Paul sets the balance using his computed value, setting balance = 80.

8. Mary sets the balance with her computed value, thus setting balance = 50

9. Peter sets the balance with his computed value, thus setting balance = 110.

So, in the end, Peter deposited 10, Mary took 50 and Paul took 20, thus balance should be reduced by -(50 + 20 - 10) = -60, i.e. balance shoud be 40 but balance reflecting is 110 :)
