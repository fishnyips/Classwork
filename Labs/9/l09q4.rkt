;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname l09q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 9, Question 4
;; **********************

(define (age buddies)
  (map third buddies))

(define (largerthan10? age)
  (cond
    ((>= age 10) true)
    (else false)))

(define (any-senior? buddies)
  (cond
    ((member? true (map largerthan10? (age buddies))) true)
    (else false)))

(define buddies
  (list (list 'cat "Mimi" 1)
        (list 'cat "Duck" 1)
        (list 'dog "Taz" 9)))

