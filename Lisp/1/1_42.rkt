#lang racket
(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc a) (+ a 1))