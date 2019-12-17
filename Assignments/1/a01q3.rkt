;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 1 Question 3
;; **********************

(define (weighted-avg-final m)
  (/ (- 37.5 (* 0.30 m)) 0.45))

(define (calculation-final a m p)
  (/ (+ (* 0.20 a) (* 0.30 m) (* 0.05 p) -50) -0.45))

(define (required-final a m p)
  (max (weighted-avg-final m) (calculation-final a m p)))