;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Module 1 Qs|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Practice Problems

;; Question 1

(define (calculate x y z)
  (+ (* x (+ y 10)) (sqrt (- (sqr 2) 4))))

;; Question 2
(define (extract-middle n)
  (remainder n 10))

;; Question 3
(define (remainder-fn x y)
  (/ x y))