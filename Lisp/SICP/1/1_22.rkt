#lang racket
(define (search-prime start count)
  (if (> count 0)
      (if (timed-test start)
          (search-prime (+ start 1) (- count 1))
          (search-prime (+ start 1) count))
      false))

(define (timed-test n)
  (start n (runtime)))

(define (start n start-time)
  (if (prime? n)
      (report-time n (- (runtime) start-time))
      false))

(define (report-time n time)
  (display n)
  (display " *** ")
  (display time)
  (newline)
  true)

(define (runtime) (current-milliseconds))

(define (prime? n)
  (= (smallest-devizor n) n))

(define (test? n count)
  (cond ((= count 0) true)
         ((ferma-test n)(test? n (- count 1)))
         (else false)))

(define (ferma-test n)
  (define (try-it a)
    (= (expmod a n n) (remainder a n)))
  (try-it (+ 1 (random (- n 1)))))


(define (smallest-devizor n)
  (find-devizor n 2))

(define (find-devizor n test-devizor)
  (cond ((> (square test-devizor) n)n)
        ((devides? n test-devizor) test-devizor)
        (else (find-devizor n (+ test-devizor 1)))))

(define (devides? a b)
  (= (remainder a b) 0))

(define (square a)
  (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2)m))
                    m))
         (else
          (remainder (* base (expmod base (- exp 1)m))
                          m))))


