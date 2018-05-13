#lang racket
(define (list-get list n)
  (if (= n 0)
      (car list)
      (list-get (cdr list) (- n 1))))

(define (length list)
  (if(null? list)
     0
     (+ (length (cdr list)) 1)))

(define (length-iter list)
  (define (length-i a count)
    (if(null? a)
      count
      (length-i (cdr a) (+ count 1))))
  (length-i list 0))

(define l1 (cons 1 (cons 2 (cons 3 (cons 4 null)))))

(define l2 (list 22 33 44 55 6))

(define (list-pair1 a)
  (if (null? (cdr a))
      a
      (list-pair1 (cdr a))))


