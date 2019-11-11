#lang racket
(define (product_iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (inc a)
  (+ a 1))

(define (cube a)
  (* a a a))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (ret a) a)

(define (factorial n)
  (product_iter ret 1 inc n))