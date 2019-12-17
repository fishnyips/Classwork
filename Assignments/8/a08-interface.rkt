;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a08-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Assignment 07 Interface

;; Question 1 - copy into a08q1.rkt and replace ... with your solution
(define (encode message)
  ...)

;; Question 2 - copy into a08q2.rkt and replace ... with your solution

;; An Airport is a (list Str (list Str Str))
;; where:
;; * the first item is the IATA code which is also the key.
;;   It is always a three-letter upper case string.
;; * the second item is the associated value of the IATA code.
;;   It is a list of length two, where the first elements is the
;;   metropolitan area served by the airport and the second
;;   element is the country of the airport.

;; An IATA-Code is a Str composed of three uppercase letters

(define alist (list (list "YYZ" (list "Toronto" "Canada"))
                    (list "YWG" (list "Winnipeg" "Canada"))
                    (list "BGO" (list "Bergen" "Norway"))
                    (list "TRF" (list "Sandefjord" "Norway"))
                    (list "YUL" (list "Montreal" "Canada"))
                    (list "LHR" (list "London" "England"))
                    (list "YVR" (list "Vancouver" "Canada"))))

(define (same-country airports iata-code)
  ...)

;; Question 3 - copy into a08q3.rkt and replace ... with your solution
(define (pascals-triangle size)
  ...)


  
