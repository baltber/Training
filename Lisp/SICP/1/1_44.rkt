#lang racket
(define dx 0.5)

(define (smooth f)
  (lambda (x) (average-3 (f (- x dx)) (f x) (f (+ x dx)))))

(define (smooth-n f n)
  ((repeat (lambda (x) (smooth x)) n) f))

(define (average-3 a b c) (/ (+ a b c) 3))

(define (repeat f n)
  (if (> n 1)
      (lambda (x) ((compose (repeat f (- n 1)) f) x))
      f))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (inc a) (+ a 1))

(define (square a) (* a a))