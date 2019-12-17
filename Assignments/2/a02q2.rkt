;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 02, Question 2
;; **********************

;; (mean) produces the arithmetic mean of 5 inputs: n1 n2 n3 n4 n5
;; mean: Num Num Num Num Num -> Num

(define (mean n1 n2 n3 n4 n5)
  (/ (+ n1 n2 n3 n4 n5) 5))

;; (variance) calculates the statistical variance of n1 n2 n3 n4 n5
;; variance: Num Num Num Num Num -> Num

;; Examples:
(check-expect(variance 2 3 2.5 3 2) 0.2)
(check-expect(variance 1 1 1 1 1) 0)

(define (variance n1 n2 n3 n4 n5)
  (/ (+ (expt (- n1 (mean n1 n2 n3 n4 n5)) 2) (expt (- n2 (mean n1 n2 n3 n4 n5)) 2)
        (expt (- n3 (mean n1 n2 n3 n4 n5)) 2) (expt (- n4 (mean n1 n2 n3 n4 n5)) 2)
        (expt (- n5 (mean n1 n2 n3 n4 n5)) 2)) 5)) 

;; Tests:
(check-expect(variance 0 0 0 0 0) 0)
(check-expect(variance -1 -1 -1 -1 -1) 0)
(check-expect(variance 0 -1 0 -1 0) 0.24)