;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l10q4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 10, Question 4
;; **********************

(define (count-suffixes los suffix)
  (local
    [(define (changetrue word)
       (cond
         [(equal? (substring word (- (string-length word)
                                     (string-length suffix))) suffix) true]
         [else empty]))]
  (length (map changetrue los))))
     