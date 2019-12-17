;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l06q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 06, Question 3
;; **********************

(define (count-helper nelos elt count)
  (cond
    ((empty? nelos)0)
    ((equal? elt (first nelos)) count)
    (else (count-helper (rest nelos) elt (add1 count)))))
           

(define (list-pos nelos elt)
  (count-helper nelos elt 0))