;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Module 4 - Lists|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Data Definition

;; An ExtNum is one of:
;; * A Num
;; * "undefined"

;; safe-reciprocal: Num -> ExtNum
(define (safe-reciprocal x)
  (cond
    [(zero? x) "undefined"]
    [else (/ 1 x)]))

;; ext-neg: ExtNum -> ExtNum
(define (ext-neg x)
  (cond
    [(number? x) (- x)]
    [else "undefined"]))

;; Data Definition of a List, a self-referential data definition
;; A list is one of:
;; * empty <- base case
;; * (cons Any List) <- refers to itself
;; homogeneous list - all the same data type


;; A (listof T) is one of:
;; * empty
;; * (cons T (listof T))
;; Always replace T with the most specific type possible in the context

;; length function -> gives you the length of a list

;; my-length (listof Int) -> Nat


;; count-apples: (listofStr) -> Nat
(define (count-thing alos thing)
  (cond
    [(empty? alos) 0]
    [(string=? (first alos) thing)
        (+ 1 (count-thing (rest alos) thing))]
    [else (count-thing (rest alos) thing)]))