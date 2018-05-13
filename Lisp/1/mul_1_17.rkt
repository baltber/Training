#lang racket
(define (mul a n)
  (mul-iter 0 a n))

(define (mul-iter prod b count)
  (if (= count 0)
      prod
      (if (even? count)
      (mul-iter prod (double b) (hive count))
      (mul-iter (+ prod b) b (- count 1)))))


(define (double a)
  (+ a a))

(define (hive a)
  (/ a 2))