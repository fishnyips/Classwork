;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 05, Question 4
;; **********************

;;Examples:
(check-expect(or-with-lists?(cons false (cons true empty)))true)

(define (or-with-lists? lob)
  (cond
    ((empty? lob) false)
    ((equal? (first lob) true)true)
    (else (or-with-lists? (rest lob)))))