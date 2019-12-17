;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a06q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 6, Question 2
;; **********************

;; An Airport is a (list Str (list Str Str))
;; where:
;; * the first item is the IATA code which is also the key.
;; It is always a three-letter upper case string.
;; * the second item is the associated value of the IATA code.
;; It is a list of length two, where the first element is the
;; metropolitan area served by the airport and the second
;; element is the country of the airport.

;; (compare-country country airports) consumes country and a list airports
;; to see if they are equal and to produce #t or #f
;; compare-country: Str (list Str (list Str Str)) -> Bool

(define (compare-country country airports)
  (cond
    ((equal? country (second airports)) true)
    (else false)))

;; (get-country iata-code airports) consumes iata-code and list airports to produce
;; the country in which the airport is located
;; get-country: Str (list Str (list Str Str)) -> Str
(define (get-country iata-code airports)
  (cond
    ((equal? (first (first airports)) iata-code) (second (second (first airports))))
    (else (get-country iata-code (rest airports)))))

;; (checker country airports) consumes country and list airports to produce
;; a list of airports in that country
;; checker: Str (list Str (list Str Str)) -> (list Str (list Str Str))
(define (checker country airports)
  (cond
    ((empty? airports) empty)
    ((compare-country country (second (first airports))) (cons (first (first airports)) (checker country (rest airports))))
    (else (checker country (rest airports)))))

;; (mysort lon) consumes lon and produces an ascending Alphabetical list
;; mysort: (listof Str -> listof Str)
(define (mysort lon)
  (cond
    [(empty? lon) empty]
    (else (insert (first lon)(mysort (rest lon))))))

;; (insert x 1) consumes x and l and produces an alphabetical list
;; insert: (listof Str -> listof Str)
(define (insert x l)
  (cond
    [(empty? l) (list x)]
    [else (if (string<=? x (first l)) (cons x l) (cons (first l) (insert x (rest l))))]))

;; (same-country airports iata-code) consumes airports and iata-code to produce
;; a list of all IATA codes in the same country
;; same-country: Constant Str -> (listof Str)

;; Examples:
(check-expect (same-country alist "YUL") (list "YUL" "YVR" "YWG" "YYZ"))

(define (same-country airports iata-code)
  (mysort (checker (get-country iata-code airports) airports)))

;; (alist) is a constant with a list of Airports and their respective locations
(define alist (list (list "YYZ" (list "Toronto" "Canada"))
 (list "YWG" (list "Winnipeg" "Canada"))
 (list "BGO" (list "Bergen" "Norway"))
 (list "TRF" (list "Sandefjord" "Norway"))
 (list "YUL" (list "Montreal" "Canada"))
 (list "LHR" (list "London" "England"))
 (list "YVR" (list "Vancouver" "Canada")))) 

;; Tests:
(check-expect (same-country alist "BGO") (list "BGO" "TRF"))
(check-expect (same-country alist "LHR") (list "LHR"))


