;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l03q02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 03, Question 2
;; **********************

;; (ring-volume) produces the volume, for inner outer and thick dimensions
;; ring-volume: Nat Nat Nat -> Nat
;; requires: inner <= outer

;; Examples
(check-within (ring-volume 3 4 2) 43.98229 0.1)
(check-within (ring-volume 2 3 4) (* 20 pi) 0.1)

(define (ring-volume inner outer thick)
  (* pi thick (- (expt outer 2) (expt inner 2))))

;; Tests
(check-expect (ring-volume 0 0 0 )0)
(check-within (ring-volume 1 5 2 ) (* 48 pi) 0.1)