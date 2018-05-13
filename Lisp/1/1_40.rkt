#lang racket
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))


(define (newton-transform g)
  (lambda (x)
    (- x ( / (g x)((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)))))

(define dx 0.00001)


(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

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