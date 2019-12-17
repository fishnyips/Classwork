;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 04, Question 3
;; **********************

;;(acceptable-bid) produces a boolean value based on whether or not
;; next-bid is at least 5% higher than the current-high
;; requires: current-high > 0

;; Examples
(check-expect(acceptable-bid? 100 104) false)
(check-expect(acceptable-bid? 3 4) true)

(define (acceptable-bid? current-high next-bid)
  (> (- (/ next-bid current-high) 1) 0.05))

;; Tests
(check-expect(acceptable-bid? 1 2)true)


