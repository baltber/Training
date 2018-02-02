#lang racket
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