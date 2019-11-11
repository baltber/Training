#lang racket
(define (acc-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (acc combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (acc combiner null-value term (next a) next b))))

(define (inc a)
  (+ a 1))

(define (ret a) a)