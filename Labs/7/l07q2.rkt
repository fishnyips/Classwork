;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname l07q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 07, Question 2
;; **********************

(define (repeat n s)
  (makelist n s n))

(define (makelist n s count)
  (cond
    ((zero? count) empty)
    (else (list s (makelist n s (sub1 count))))))


