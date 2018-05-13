#lang racket

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


(define (fib)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(define (x-x)
  (fixed-point g 2.0))

(define (g x) 
  (define (average x y) (/ (+ x y) 2)) 
  (average x (/ (log 1000) (log x))))

(define (exp a n)
  (exp-iter 1 a n))

(define (exp-iter prod b count)
  (if (= count 0)
      prod
      (if (even? count)
          (exp-iter prod (square b) (/ count 2))
          (exp-iter (* prod b) b (- count 1)))))

(define (square a)
  (* a a))