```scheme
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 206 40)
```

---

- Using **applicative-order evaluation**, remainder is called 4 times.

```scheme
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)
2
```

---

- Using **normal-order evaluation**, remainder is called 18 times.

```scheme

(gcd 206 40)

(gcd 40 (remainder 206 40))

(if (= 6 0)) +1

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0) +2

(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))) +4

(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder (206 40))) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder (206 40))) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0) +7
  (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) +4
```

$$1 + 2 + 4 + 7 + 4 = 18$$

