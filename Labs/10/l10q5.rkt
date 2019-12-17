;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l10q5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 10, Question 5
;; **********************

(define (samehashtag? hashtag compare)
  (cond
    [(equal? hashtag compare) true]
    [else false]))

(define (matching-messages tweets hashtag)
    (map samehashtag? tweets))

(define some-tweets
  (list (list "@julia" "I am very excited"
              (list "#bikeride" "#nohomework"))
        (list "@jack" "Frustrating..."
              (list "#notsunny" "#toomuchhomework"))
        (list "@jessica" "What should I do?"
              (list "#nohomework" "#raining"))))