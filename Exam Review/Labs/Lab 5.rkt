;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 5|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 5

(define (add-prefix los pre)
  (cond
    [(empty? los) empty]
    [else (cons (string-append  pre " " (first los)) (add-prefix (rest los) pre))]))

(define (count-even-strings los)
  (cond
    [(empty? los) 0]
    [(even? (string-length (first los))) (+ 1 (count-even-strings (rest los)))]
    [else (count-even-strings (rest los))]))

(define (longest-string-length los)
  (cond
    [(empty? los) 0]
    [else (max (string-length (first los)) (longest-string-length (rest los)))]))

(define (strings-with-prefix los pre)
  (cond
    [(empty? los) empty]
    [(equal? (substring (first los) 0 (string-length pre)) pre) (first los)]
    [else (strings-with-prefix (rest los) pre)]))

(define (next-list alist item)
  (cond
    [(empty? alist) empty]
    [(empty? (rest alist)) "None"]
    [(equal? (first alist) item) (first (rest alist))]
    [else (next-list (rest alist) item)]))