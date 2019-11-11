#lang racket
(define (count-change amount coin-values)
  (cc amount coin-values))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                     (except-first-denomination coin-values))
                 (cc (- amount (first-denomination coin-values))
                     coin-values)))))

(define (except-first-denomination l)
  (cdr l))

(define (no-more? l)
  (null? l))

(define (first-denomination coin-values)
   (car coin-values))

(define us-coins (list 50 25 10 5 1))

(define test (count-change 100 us-coins))