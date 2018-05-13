#lang racket

(define (sum-simple a b)
  (acc-filter prime? + 0 ret a inc b))

(define (sum-simple-square a b)
  (acc-filter prime? + 0 square a inc b))

(define (sum-simple-n n)
  (define (simple-n? k) (= (gcd n k) 1))
(acc-filter simple-n? + 0 ret 1 inc n))

(define (acc-filter predicate combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (predicate a)
      (combiner (term a) (acc-filter predicate combiner null-value term (next a) next b))
      (acc-filter predicate combiner null-value term (next a) next b))))

(define (inc a)
  (+ a 1))

(define (ret a) a)

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (smallest-devizor n)
  (find-devizor n 2))

(define (find-devizor n test-devizor)
  (cond ((> (square test-devizor) n)n)
        ((devides? n test-devizor) test-devizor)
        (else (find-devizor n (+ test-devizor 1)))))

(define (devides? a b)
  (= (remainder a b) 0))

(define (square a)
  (* a a))

(define (prime? a)
  (= a (smallest-devizor a)))