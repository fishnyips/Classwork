;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 03, Question 1
;; **********************

;; (quadrant) produces a quandrant number for the inputs x y, based on the Euclidean Plane
;; quadrant: Num Num -> Nat

;; Examples:
(check-expect(quadrant 3 5)1)
(check-expect(quadrant -5 -2/3)3) ;Error
(check-expect(quadrant pi (- (sqrt 2)))4)
(check-expect(quadrant 0 0)0)
(check-expect(quadrant 0 9)-2) ;Error

(define (quadrant x y)
  (cond
    ((and(= x 0) (= y 0))0)
    ((= x 0)-2)
    ((= y 0)-1)
    ((and(> x 0) (> y 0))1)
    ((and(< x 0) (> y 0))2)
    ((and(< x 0) (< y 0))3)
    ((and(> x 0) (< y 0))4)))

;; Tests:
(check-expect(quadrant 0 -1)-2)
(check-expect(quadrant -10 -10)3)
    
    