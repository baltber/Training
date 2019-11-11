#lang racket
(define (mul a n)
  (mul-iter a n 0))

(define (mul-iter a b prod)
  (cond ((= a 0) prod)
         ((even? a) (mul-iter (hive a) (double b) prod))
         (else(mul-iter (- a 1) b (+ b prod)))))

(define (double a)
  (+ a a))

(define (hive a)
  (/ a 2))
