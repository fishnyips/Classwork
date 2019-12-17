;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a05q2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 5, Question 2
;; **********************

;; (convert-los msg) produces a list of characters from string input msg
;; convert-los: Str -> (listof Char)
;; requires: msg Str to be composed of " ", Str and Nat
(define (convert-los msg)
  (string->list msg))

;; (convert-num converted) produces a Char from list input converted
;; convert-num: (listof Char) -> Char
(define (convert-num converted)
  (cond
    ((empty? converted) empty)
    ((and (>= (char->integer (first converted)) 48)
          (<= (char->integer (first converted)) 57))
     (first converted))))

;; (convert-space converted) produces a Char from list input converted
;; convert-space: (listof Char) -> Char
(define (convert-space converted)
  (cond
    ((empty? converted) empty)
    ((= 32 (char->integer (first converted)))
     (first converted))))

;; (convert-capital converted) produces a Char from list input converted
;; convert-capital: (listof Char) -> Char
(define (convert-capital converted)
  (cond
    ((empty? converted) empty)
    ((<= 65 (char->integer (first converted)) 90)
     (cond
       ((> (+ (- (char->integer (first converted)) (char->integer #\A)) 13) 25)
        (integer->char (+ (- (+ (- (char->integer (first converted))
                                         (char->integer #\A)) 13) 25) 64)))
       (else (integer->char (+ (+ (- (char->integer (first converted))
                                           (char->integer #\A)) 13) 65)))))))

;; (convert-lower converted) produces a Char from list input converted
;; convert-lower: (listof Char) -> Char
(define (convert-lower converted)
  (cond
    ((empty? converted) empty)
    ((<= 97 (char->integer (first converted)) 122)
     (cond
       ((> (+ (- (char->integer (first converted)) (char->integer #\a)) 13) 25)
        (integer->char (+ (- (+ (- (char->integer (first converted))
                                         (char->integer #\a)) 13) 25) 96)))
       (else (integer->char (+ (+ (- (char->integer (first converted))
                                           (char->integer #\a)) 13) 97)))))))

;; (scramble converted) produces a listof Char from list input converted
;; scramble: (listof Char) -> (listof Char)
(define (scramble converted)
  (cond
    ((empty? converted) empty)
    ((and (>= (char->integer (first converted)) 48)
          (<= (char->integer (first converted)) 57))
     (cons (convert-num converted) (scramble (rest converted))))
    ((= 32 (char->integer (first converted)))
     (cons (convert-space converted) (scramble (rest converted))))
    ((<= 65 (char->integer (first converted)) 90)
     (cons (convert-capital converted) (scramble (rest converted))))
    ((<= 97 (char->integer (first converted)) 122)
     (cons (convert-lower converted) (scramble (rest converted))))
    (else (scramble (rest converted)))))

;; (rot-13 msg) produces an encoded Str from Str
;; rot-13: Str -> Str
;; requires: msg Str to be composed of " ", Str and Nat

;; Examples:
(check-expect (rot-13 "Computer Science 115") "Pbzchgre Fpvrapr 115")

(define (rot-13 msg)
  (list->string (scramble (convert-los msg))))

;; Tests:
(check-expect (rot-13 "0") "0")       ; Just a number
(check-expect (rot-13 " ") " ")       ; Just a space 
(check-expect (rot-13 "abc") "nop")   ; Only lowercase - not back to a
(check-expect (rot-13 "xyz") "klm")   ; Only lowercase - circle back to a
(check-expect (rot-13 "ABC") "NOP")   ; Only uppercase - not back to a
(check-expect (rot-13 "XYZ") "KLM")   ; Only uppercase - circle back to a
(check-expect (rot-13 "1Ab ") "1No ") ; All combinations together
    
