#lang racket
(define (double f)
  (lambda (x) (f (f x))))

(define (inc a) (+ a 1))