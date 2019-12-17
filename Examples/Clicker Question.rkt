;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Clicker Question|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (alt-list=? list1 list2)
  (or (and (empty? list1) (empty? list2))
      (and (= (first list1) (first list2))
           (alt-list=? (rest list1) (rest list2)))))
          