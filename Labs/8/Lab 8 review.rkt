;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 8 review|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 8

;; Question 1

(define (key asso)
  (first asso))

(define (value asso)
  (second asso))

(define (extract-values keys assolist)
  (cond
    [(or (empty? keys) (empty? assolist)) empty]
    [(member? (key (first assolist)) keys)
     (cons (value (first assolist))
           (extract-values keys (rest assolist)))]
    [else
     (extract-values keys (rest assolist))]))

;; Question 2
(define (helper bad whole result)
  (cond
    [(or (empty? bad) (empty? whole)) result]
    [(equal? (first bad) (first whole)) (helper (rest bad) (rest whole) result)]
    [else (helper bad (rest whole) (append result (list (first whole))))]))

(define (extract-bad bad-part whole-string)
  (list->string (helper (string->list bad-part) (string->list whole-string) empty)))
  


     
     
;; Question 3
