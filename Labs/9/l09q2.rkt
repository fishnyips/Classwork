;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l09q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 9, Question 2
;; **********************

(define (switch-charcase str)
  (cond
    ((char-lower-case? str) (char-upcase str))
    ((char-upper-case? str) (char-downcase str))
    ((equal? str "") "")
    (else str)))

(define (switch-case str)
  (list->string (map switch-charcase (string->list str))))
