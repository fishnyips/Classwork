;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a04q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 04, Question 3
;; **********************


;; (convert-to-types) takes a list of values and produces a list of their respective
;; data types, as restrictive as possible
;; convert-to-types: (listof Str) -> (listof Str)

;; Examples:
(check-expect(convert-to-types empty)empty)
(check-expect(convert-to-types
              (cons "-3.4"(cons "#true" (cons "cs115" (cons "2"
              (cons "false" (cons "#t" empty)))))))
              (cons "Num" (cons "Bool" (cons "Str" (cons "Nat"
              (cons "Bool" (cons "Bool" empty)))))))

(define (convert-to-types values)
  (cond
    ((empty? values) empty)
    ((number? (string->number (first values))); Test for if value is a number
     (cond
       ((equal? (floor (string->number (first values)))
                (string->number (first values))) ; Test for Nat Numbers
        (cons "Nat" (convert-to-types (rest values)))) 
       ((integer? (string->number (first values)))     ; Test for Integers
        (cons "Int" (convert-to-types (rest values))))
       (else
        (cons "Num" (convert-to-types (rest values))))))
    ((or (equal? (first values) "true")
         (equal? (first values) "false")
         (equal? (first values) "#t")
         (equal? (first values) "#f")
         (equal? (first values) "#true")
         (equal? (first values) "#false")) ; Test for Booleans
     (cons "Bool" (convert-to-types (rest values))))
    ((string? (first values))              ; Test for Strings
     (cons "Str" (convert-to-types (rest values))))
    (else (convert-to-types (rest values)))))

;; Tests:
(check-expect(convert-to-types (cons "4" (cons "4.1" (cons "true" (cons "pi" empty)))))
             (cons "Nat" (cons "Num"(cons "Bool" (cons "Str" empty)))))
(check-expect(convert-to-types (cons "empty" empty))(cons "Str" empty))