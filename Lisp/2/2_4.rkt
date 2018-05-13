#lang racket
(define (cons1 x y)
  (define (despatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Wrong argument -- " m))))
  despatch)

(define (car1 z) (z 0))

(define (cdr1 z) (z 1))


(define (cons2 x y)
  (lambda (m) (m x y)))

(define (car2 z)
  (z (lambda (p q) p)))

(define (cdr2 z)
  (z (lambda (p q) q)))


(define (test1) (= (car1 (cons1 2 3)) 2))
(define (test2) (= (cdr1 (cons1 2 3)) 3))
(define (test3) (= (car2 (cons2 2 3)) 2))
(define (test4) (= (cdr2 (cons2 2 3)) 3))

(define (tests)
  (test1)
  (test2)
  (test3)
  (test4))