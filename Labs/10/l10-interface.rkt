;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname l10-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #t () #t)))
;; A Tweet is a (list Str Str (listof Str)), where
;; * The first value is the name of the tweeter, starting with @
;; * The second value is message, containing at most 280 characters
;; * The third value is a list of hashtags, each starting with #

;; l10q1
(define (prefixes str)
  ...)

;; l10q2
(define (powers-of-two n)
  ...)

;; l10q3
;; Part a
(define (mult-table width height)
  ...)

;; Part b
(define (times-table width height)
  ...)

;; l10q4
(define (count-suffixes los suffix)
  ...)

;; l10q5
(define (matching-messages tweets hashtag)
  ...)