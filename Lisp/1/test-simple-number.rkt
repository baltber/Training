#lang racket
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                   2))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (square a)
  (* a a))

(define (test-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (test-prime? n (- times 1)))
        (else false)))