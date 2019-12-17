;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a08q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 8, Question 3
;; **********************

(define (botnum n)
  (range 1 (+ n 1) 1))

(define (factorial n)
  (foldr * 1 (range 1 (+ n 1) 1)))

(define (combine n k)
  (/ (factorial n) (* (factorial (- n k)) (factorial k))))

(define (pascals-triangle size)
  (foldr (build-list )



