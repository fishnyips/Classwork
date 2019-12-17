;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Dictionaries) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define al (list (list 4 "Mark")))
;; An Association (As) is a (list Num Str)
;; An Association List (Al) is a (listof As)

;; lookup: Num Al -> (anyof Str false)
(define (lookup key al)
  (cond
    [(empty? al) false] ; Value of Key doesn't exist
    [(equal? key (first (first al))) (second (first al))]
    [else (lookup key (rest al))]))