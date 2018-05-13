#lang racket
(define (add-interval x y)
  (make-interval(+ (lower-bound x) (lower-bound y))
                (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  ((if (<= (* (lower-bound y) (upper-bound y)) 0)
       (error "NPE")
       (mul-interval x (make-interval (/ 1.0 (upper-bound y))
                                      (/ 1.0 (lower-bound y)))))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

(define (sub-interval x y) 
  (make-interval (- (lower-bound x) (upper-bound y)) 
                 (- (upper-bound x) (lower-bound y))))

(define (radius i)
  (/ (-( upper-bound i) (lower-bound i)) 2.0))

(define i1 (make-interval 1 9))
(define i2 (make-interval 3 5))

(define test-sub (sub-interval i1 i2))

(define test-r (radius i1))