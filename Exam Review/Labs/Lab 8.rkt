;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Lab 8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Lab 8

;; Question 1
(define (key asso)
  (first asso))
(define (value asso)
  (second asso))

(define (extract-values keys assolist)
  (cond
    [(or (empty? assolist) (empty? keys)) empty]
    [(member? (key (first assolist)) keys)
     (cons (value (first assolist))
           (extract-values keys (rest assolist)))]
    [else
     (extract-values keys (rest assolist))]))

;; Question 2
(define (extract-badhelp bad lochar)
  (cond
    [(and (empty? bad) (empty? lochar)) empty]
    [(and (cons? bad) (empty? lochar)) empty]
    [(and (empty? bad) (cons? lochar)) lochar]
    [else
     (cond
       [(equal? (first lochar) (first bad)) (cons (rest lochar) (extract-badhelp (rest bad) (rest lochar)))]
       [else (extract-badhelp (rest bad) (rest lochar))])]))

(define (extract-bad bad-part whole-string)
  (extract-badhelp (string->list bad-part) (string->list whole-string)))

;; Question 3
(define (subseq-string pattern target)
  (list->string (subseq-stringhelp (string->list pattern) (string->list target))))

(define (subseq-stringhelp pattern target)
  (cond
    [(and (empty? pattern) (cons? target)) target]
    [(and (empty? pattern) (empty? target)) empty]
    [(and (cons? pattern) (empty? target)) empty]
    [(and (cons? pattern) (cons? target))
     (cond
       [(equal? (first pattern) (first target))
        (cons (char-upcase (first pattern)) (subseq-stringhelp (rest pattern) (rest target)))]
       (else (cons (first target) (subseq-stringhelp pattern (rest target)))))]))

;; Question 4
(define (clicker-grades corr-answers stu-answers)
  (cond
    [(or (empty? corr-answers) (empty? stu-answers)) 0]
    [(not (equal? (first corr-answers) (first stu-answers))) 0]
    [else (+ 1 (clicker-grades (rest corr-answers) (rest stu-answers)))]))

;; Question 5
(define (clicker-grades-absent corr-answers stu-answers)
  (cond
    [(and (empty? corr-answers) (empty? stu-answers)) 0]
    [(and (cons? corr-answers) (empty? stu-answers)) 0]
    [else
     (cond
       [(not (equal? (first corr-answers) (first stu-answers))) 0]
       [else (+ 1 (clicker-grades-absent (rest corr-answers) (rest stu-answers)))])]))
  
