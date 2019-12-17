;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 10

;; Question 1
(define (prefixes str)
  (map (lambda (x) (substring str 0 x)) (build-list (string-length str) add1)))

;; Question 2
(define (powers-of-two n)
  (map (lambda (x) (expt 2 (- x 1))) (sort (build-list (+ n 1) add1) >)))

;; Question 3
(define (mult-table width height)
  (range 0 (+ width 1) 0))

;; Question 4
(define (same-length string suffix)
  (cond
    [(equal? (substring string (- (string-length string) 2)) suffix) true]
    [else false]))

(define (count-suffixes los suffix)
  (length (filter (lambda (x) (same-length x suffix)) los)))

;; Question 5
(define some-tweets
  (list (list "@julia" "I am very excited"
              (list "#bikeride" "#nohomework"))
        (list "@jack" "Frustrating..."
              (list "#notsunny" "#toomuchhomework"))
        (list "@jessica" "What should I do?"
              (list "#nohomework" "#raining"))))

(define (lohashtags tweet) (rest (rest tweet)))

(define (matching-messages tweets hashtag)
  (flatten (map lohashtags tweets)))