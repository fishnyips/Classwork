;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 06, Question 2
;; **********************

(define (flip-case str)
  (cond
    ((empty? str) empty)
    ((char-lower-case? (first str)) (cons (char-upcase (first str)) (flip-case (rest str))))
    ((char-upper-case? (first str)) (cons (char-downcase (first str)) (flip-case (rest str))))
    (else (flip-case (rest str)))))

(define (switch-case str)
  (list->string (flip-case (string->list str))))