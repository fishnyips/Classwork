;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname a06-interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; Q1

(define (approximate-pi n)
  ...)



;; Q2

;; An Airport is a (list Str (list Str Str))
;; where:
;; * the first item is the IATA code which is also the key.
;;   It is always a three-letter upper case string.
;; * the second item is the associated value of the IATA code.
;;   It is a list of length two, where the first element is the
;;   metropolitan area served by the airport and the second
;;   element is the country of the airport.

(define (same-country airports iata-code)
  ...)



;; Q3

;; A DataTypeDictionary is an association list, where
;;   * the keys are one of "Num", "Str", "Char", or "Bool", and
;;   * the associated values are lists, where the types of
;;     the elements match the type indicated by the key.
;;     There are no duplicate values in these lists.

;; An Action is a (list (anyof "add" "remove") (anyof Num Str Char Bool))
;; where,
;;   * the first element of the list represents an instruction
;;   * the second element of the list is a value either
;;     being added or removed from a dictionary.

(define (update data act)
  ...)
