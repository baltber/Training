#lang racket
;;;;constructors
(define (make-reqtangle otr1 otr2 otr3 otr4)
  (cons (cons otr1 otr2) (cons otr3 otr4)))

(define (get-otr1 o) (car (car o)))
(define (get-otr2 o) (car (cdr o)))
(define (get-otr3 o) (cdr (car o)))
(define (get-otr4 o) (cdr (cdr o)))

(define (make-segment a b) (cons a b))

(define (start-segment a) (car a))

(define (end-segment a) (cdr a))

(define (make-point x y) (cons x y))

(define (x-point a) (car a))

(define (y-point a) (cdr a))

;;;getters
(define (get-height-length req)
  (length-otr (get-otr1 req)))

(define (get-weight-length req)
  (length-otr (get-otr1 req)))

;;;;functions
(define (average-point a b)
  (abs ( / (+ a b) 2.0)))

(define (length-otr otr) (sqrt(+ (square (- (x-point (end-segment otr)) (x-point (start-segment otr))))
                             (square (- (y-point (end-segment otr)) (y-point (start-segment otr)))))))

(define (sqrt x)
  (define (good? g)
    (< (abs (- (square g) x)) 0.0001))
  (define (improve g)
    (average g (/ x g)))
  (define (sqrt-iter g)
    (if (good? g)
        g
        (sqrt-iter (improve g))))
  (sqrt-iter 1.0))

(define (square a) (* a a))

(define (average a b)
  (/(+ a b) 2))


(define (perimetr req)
  (+ (length-otr(get-otr1 req))
     (length-otr(get-otr2 req))
     (length-otr(get-otr3 req))
     (length-otr(get-otr4 req))))

(define (area req)
   (* (length-otr(get-otr1 req))
      (length-otr(get-otr2 req))))

(define (perimetr-commons req)
  (* 2 (+ (get-height-length req)
          (get-weight-length req))))

;;;;print
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (print-segment s)
  (newline)
  (display "[")
  (display (print-point (start-segment s)))
  (display ", ")
  (display (print-point (end-segment s)))
  (display "]"))

(define (print-reqtangle req)
  (newline)
  (display "{")
  (display (print-segment (get-otr1 req)))
  (display ", ")
  (display (print-segment (get-otr2 req)))
  (display (print-segment (get-otr3 req)))
  (display ", ")
  (display (print-segment (get-otr4 req)))
  (display "}")
  )

(define (print-length l)
(newline)
  (display "{")
  (display l)
  (display "}")
  )

;;;;tests
(define (test) (print-reqtangle reqtangle))

(define (test-length) (length-otr otr1))

(define (test-perimetr) (perimetr reqtangle))

(define (test-perimetr-commons) (perimetr-commons reqtangle))

(define (test-area) (area reqtangle))

(define otr1 (make-segment (make-point 1 1) (make-point 1 6)))
(define otr2 (make-segment (make-point 1 6) (make-point 6 6)))
(define otr3 (make-segment (make-point 6 6) (make-point 6 1)))
(define otr4 (make-segment (make-point 6 1) (make-point 1 1)))

(define reqtangle (make-reqtangle otr1 otr2 otr3 otr4))

