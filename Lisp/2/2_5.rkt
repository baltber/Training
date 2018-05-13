#lang racket

(define (exp a n)
  (exp-iter 1 a n))

(define (exp-iter prod b count)
  (if (= count 0)
      prod
      (if (even? count)
          (exp-iter prod (square b) (/ count 2))
          (exp-iter (* prod b) b (- count 1)))))



(define (square a) (* a a))

(define (cube a) (* a a a))

(define (average a b)
  (/(+ a b) 2))

(define (cons2 a b)
  (* (exp 2 a)(exp 3 b)))

(define (car2 z)
  (por 2 z))

(define (cdr2 z)
  (por 3 z))

(define (por base value)
  (define (por-iter value count)
    (if (= (remainder value base) 0)
        (por-iter (/ value base) (+ count 1))
        count))
  (por-iter value 0))

(define (test) (cdr2 (cons2 2 4)))



