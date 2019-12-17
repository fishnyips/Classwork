;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a08q1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 8, Question 1
;; **********************

;; (encode message) produces a coded message:
;; all non-alphanumeric characters are removed
;; all numeric characters are unchanged
;; all alphabetic characters appear as uppercase letters, where they are
;; swapped with the letter in the same relative position at the other end of the
;; alphabet

;; Examples:
;;(check-expect (encode "I love CS115!") "ROLEVXH115")

(define (encode message)
  (local
    ;; (char-increment character) produces the increment away from A
    ((define (char-incrementlower character) (- (char->integer character) 97))
     (define (char-incrementupper character) (- (char->integer character) 65))
     (define numberrange (range 49 58 1))
     (define lowercaserange (range 97 123 1))
     (define uppercaserange (range 65 91 1))
    ;; (convert character) produces a changed character if
     ;; lowercase and a non-alphanumeric character
     ;; the same character if uppercase or numeric
    (define (convert character)
      (cond
         ((member? (char->integer character) lowercaserange)
         (char-upcase (integer->char (+ (char->integer character) (- 25 (* 2 (char-incrementlower character)))))))
         ((member? (char->integer character) numberrange) character)
         ((member? (char->integer character) uppercaserange)
          (integer->char (+ (char->integer character) (- 25 (* 2 (char-incrementupper character))))))
         (else #\0)
         )))
  (list->string (map convert (string->list message)))))

;; Find out what the blank character is or how to remove characters


