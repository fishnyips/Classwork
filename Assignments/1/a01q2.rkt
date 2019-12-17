;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a01q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 1 Question 2
;; **********************

(define (wind-chill t-air v)
  (round (inexact->exact (+ 13.12 (* 0.6215 t-air)
         (* -11.37 (expt v 0.16)) (* 0.3965 t-air (expt v 0.16))))))
