;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a08q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 8, Question 2
;; **********************

(define alist (list (list "YYZ" (list "Toronto" "Canada"))
 (list "YWG" (list "Winnipeg" "Canada"))
 (list "BGO" (list "Bergen" "Norway"))
 (list "TRF" (list "Sandefjord" "Norway"))
 (list "YUL" (list "Montreal" "Canada"))
 (list "LHR" (list "London" "England"))
 (list "YVR" (list "Vancouver" "Canada")))) 

(define (get-country iata alist)
  (cond
    [(equal? (first (first alist)) iata)] (second (second alist)))



(define (target-country iata alist)
  (cond
    
