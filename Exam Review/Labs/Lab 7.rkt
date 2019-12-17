;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 7

(define (count-down n b)
  (cond
    [(zero? b) (cons b empty)]
    [else (count-down (sub1 n) b)]))

;; Question 2
(define (repeat n s)
  (cond
    [(= n 1) (cons s empty)]
    [else (cons s (repeat (sub1 n) s))]))

;; Question 3
(define (exponent base expt)
  (cond
    [(= expt 0) 1]
    [(= expt 1) base]
    [else (* base (exponent base (sub1 expt)))]))

;; Question 5
(define (total-price-list lol)
  (cond
    [(empty? lol) empty]
    [else (list (list (first (first lol)) (* (second (first lol)) (third (first lol)))) (total-price-list (rest lol)))]))

;; Question 6
(define (remove-al key al)
  (cond
    [(empty? al) empty]
    [(equal? key (first (first al))) (rest al)]
    [else (cons (first al) (remove-al key (rest al)))]))

;; Question 7
;;(define (exponent-without-mult base expt)
;;  (cond
;;    [(zero? 