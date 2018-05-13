#lang racket
(define (repeat f n)
  (if (> n 1)
      (lambda (x) ((compose (repeat f (- n 1)) f) x))
      f))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc a) (+ a 1))

(define (square a) (* a a))