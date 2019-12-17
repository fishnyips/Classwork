;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a06q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 6, Question 1
;; **********************

;; (approximate-pi n) calculates an approximation of pi by consuming n
;; , adding up the first n + 1 terms of an infinite series and multiplies
;; the sum by 4
;; approximate-pi: Nat -> Num

;; Examples:
(check-expect (approximate-pi 0) 4)
(check-expect (approximate-pi 1) (/ 8 3))

(define (approximate-pi n)
  (* 4 (calculate-pi 0 n 1)))

;; Tests:
(check-expect (approximate-pi 3) (/ 304 105))
(check-expect (approximate-pi 5) (/ 10312 3465))

;; (calculate-pi index end sign) calculates an approximation of pi by consuming an index
;; multiplied by either a positive of negative sign until end
;; calculate-pi: Nat Nat Nat -> Num
;; requires: sign = 1

(define (calculate-pi index end sign)
  (cond
     ((> index end) 0)
     (else (+ (/ 1 (* (add1 (* 2 index)) sign)) (calculate-pi (add1 index) end (* -1 sign))))))

