;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 04, Question 2
;; **********************

;;(in-subset-1) produces a boolean value if x is within the subset of (3 < x <= 7)
;; in-subset-1: Num -> Bool

;; Examples:

(check-expect(in-subset-1? 5)true)
(define (in-subset-1? x)
  (and(< 3 x)(< x 7)))

;; Tests:
(check-expect(in-subset-1? 2)false)
(check-expect(in-subset-1? -3)false)

;;(in-subset-2) produces a boolean value if x is within the subset of the union of (1<x<3) and (9<x<11)
;; in-subset-2: Num -> Bool

;; Examples:
(check-expect(in-subset-2? 10)true)
(define (in-subset-2? x)
  (or (and (< 1 x)(< x 3)) (and(< 9 x)(< x 11))))

;; Tests:
(check-expect(in-subset-2? 5)false)
(check-expect(in-subset-2? 0)false)

;;(in-subset-3) produces a boolean value if x is within the subset of the range of numbers outside of (1 <= x <= 3)
;; in-subset-3: Num -> Bool

;; Example:
(check-expect(in-subset-3? 10)true)

(define (in-subset-3? x)
  (not(and(>= x 1)(>= 3 x))))

;; Tests:
(check-expect(in-subset-3? 2)false)
(check-expect(in-subset-3? 0)true)
