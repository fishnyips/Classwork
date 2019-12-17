;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a08q3-correct) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (pascals-triangle size)
  (local
    [;;
     (define (factorial n)
       (foldr * 1 (range 1 (add1 n) 1)))
     (define (p-row n)
       (local
         [
          (define (choose k)
           (/ (factorial n) (* (factorial (- n k)) (factorial k))))]
         (build-list (add1 n) choose)))]
     (build-list size p-row)))
  