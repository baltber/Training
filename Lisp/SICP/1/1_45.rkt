#lang racket


(define (sqr x n dumps)
  (fixed-point (average-dump-n (lambda (y) (/ x (exp y (- n 1)))) dumps) 1.0))

(define (average-dump-n f n)
  ((repeat (lambda (x) (average-dump x)) n) f))

(define (repeat f n)
  (if (> n 1)
      (lambda (x) ((compose (repeat f (- n 1)) f) x))
      f))


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

(define (average-dump f)
  (define (average a b) (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

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