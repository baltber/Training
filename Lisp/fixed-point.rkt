#lang racket

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
      (try first-guess))
  

(define (close-enough? a b)
    (< (abs (- a b)) 0.00001))
