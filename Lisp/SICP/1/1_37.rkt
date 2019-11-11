#lang racket
(define (cont-frac n d k)
  (define (iter i)
    (/ (n 1) (+ (d i)
                (if (< i k)
                    (iter (+ i 1))
                    0))))
  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i acc)
    (let ((acc (/ (n i) (+ (d i) acc)))
          (i (- i 1)))
      (if (> i 0)
          (iter i acc)
          acc)))
  (iter k 0))

(define (golden-ratio) (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(define (golden-ratio-function k) 
  (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))

(define (golden-ratio-function-iter k) 
  (/ 1 (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) k)))


(define (fixed-point f first-guess)
  (define (try guess iter)
    (display iter) 
    (display ": ") 
    (display guess) 
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ iter 1)))))
      (try first-guess 1))
  

(define (close-enough? a b)
    (< (abs (- a b)) 0.00001))