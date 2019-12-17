;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 6|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 6

;; Question 1
(define (letteradder lochar)
  (cond
    [(empty? lochar) empty]
    [(equal? (first lochar) #\o) (cons #\o (cons #\u (rest lochar)))]
    [else (cons (first lochar) (letteradder (rest lochar)))]))

(define (canadianize s)
  (list->string (letteradder (string->list s))))

;; Question 2
(define (switchcases loc)
  (cond
    [(empty? loc) empty]
    [(char-upper-case? (first loc)) (cons (char-downcase (first loc)) (switchcases (rest loc)))]
    [(char-lower-case? (first loc)) (cons (char-upcase (first loc)) (switchcases (rest loc)))]
    [else (cons (first loc) (switchcases (rest loc)))]))

(define (switch-case str)
  (list->string (switchcases (string->list str))))

;; Question 3
(define (list-pos nelos elt)
  (cond
    [(equal? (first nelos) elt) 0]
    [else (+ 1 (list-pos (rest nelos) elt))]))

;; Question 4
(define (differences nelon)
  (cond
    [(empty? nelon) 1]
    [(empty? (rest nelon)) empty]
    [else (cons (- (first nelon) (first (rest nelon))) (differences (rest nelon)))]))

;; Question 5
(define (total-grade log)
  (cond
    [(empty? log) 0]
    [else (+ (first log) (total-grade (rest log)))]))

(define (average-helper log average total)
  (cond
    [(empty? log) empty]
    [(> (first log) average) (cons (first log) (average-helper (rest log) average total))]
    [else (average-helper (rest log) average total)]))

(define (average-filter log)
  (average-helper log (/ (total-grade log) (length log)) (total-grade log)))



  
