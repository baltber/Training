#lang racket
(define (sum a b)
  (+ a b))

(define (sub a b)
  (- a b)) 

(define (sum-g a b c)
  (cond((and (< a b) (< a c)) (sum b c))
       ((and (< b a) (< b c)) (sum a c))
       (else (sum a b))))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(define (sqrt1 x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter pred x)
  (if (?good pred x)
      pred
      (sqrt-iter (improve pred x) x)))

(define (sqrt-iter3 pred x)
  (if (good3? pred x)
      pred
      (sqrt-iter3 (improve-cube pred x) x)))

(define (sqrt3 x)
  (sqrt-iter3 1.0 x))

(define (pow1 a n)
  (pow-iter a n))

(define (pow-iter a n)
  (if (or (= a 1) (= n 0))
      1
      (* (pow-iter a (- n 1)) a)))

(define (improve pred x)
  (avg pred (/ x pred)))

(define (avg x y)
  (/ (+ x y) 2))

(define (?good x a)
   (< (abs(-(square x) a)) 0.00000001))

(define (square a)
  (* a a))

(define (improve-cube y x)
  (/ (+ (/ x (square y)) (* 2 y))3))

(define (cube a)
  (* a a a))

(define (good3? pred a)
  (<
   (abs(-
       (cube pred)
       a))
   0.001))


