#lang racket
(define (func f a)
  (f a))

(define (cube a)
  (* a a a))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc a) (+ a 1))

(define (sum-cubes a b)
  (sum cube a inc b))