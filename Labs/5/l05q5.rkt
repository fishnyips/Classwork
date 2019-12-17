;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 05, Question 5
;; **********************

(define (strings-with-prefix los pre)
  (cond
    ((empty? los) empty)
    ((equal? (substring (first los) 0 (string-length pre)) pre)
     (cons (first los) (strings-with-prefix (rest los) pre)))
    (else (strings-with-prefix (rest los) pre))))