;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a02q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 02, Question 3
;; **********************

;; (even-odd) produces either a 1 or 0 based on whether 7 bit string s is odd or even, respectively.
;; even-odd: Str -> Nat
;; requires 7 digits made of a combination of 1 and 0

(define (even-odd s)
  (remainder (numberof-ones s) 2))

;; (numberof-ones) produces the total number of 1s present in a 7 bit Str
;; numberof-ones: Str -> Nat

(define (numberof-ones s)
  (+ (string->number (substring s 0 1))
     (string->number (substring s 1 2))
     (string->number (substring s 2 3))
     (string->number (substring s 3 4))
     (string->number (substring s 4 5))
     (string->number (substring s 5 6))
     (string->number (substring s 6 7))))

;; (eighth-bit) produces a 1 or 0 based on whether the 7 bit string s is even or odd, respectively.
;; eighth-bit: Str -> Str
(define (eighth-bit s)
  (number->string (abs (- (even-odd s) 1))))

;; (add-parity-bit) produces an 8 bit string based on the number of 1s in Str s, ensuring the 8 bit Str contains an odd number of 1s
;; add-parity-bit: Str -> Str
;; requires 7 digit string made of a combination of 1 and 0

;; Examples:
(check-expect(add-parity-bit "1100101")"11001011")

(define (add-parity-bit s)
  (string-append s (eighth-bit s)))

;; Tests:
(check-expect(add-parity-bit "0000001")"00000010")
(check-expect(add-parity-bit "1111111")"11111110")
(check-expect(add-parity-bit "1111110")"11111101")


