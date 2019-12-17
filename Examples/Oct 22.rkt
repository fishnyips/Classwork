;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Oct 22|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;Midterm Materials
;; Modules 1-4
;; Assignments 1-5
;; Mix of multiple choice and programming questions, some stepping

; Range generalizes countup-by
; (range 4 7 1) -> (cons 4 (cons 5 (cons 6 empty)))

; Assignment #5 Tips
(define (unicode-string start end)
  (cond
     ((= start end) empty)
     (else (cons (integer->char start)
                 (unicode-string (add1 start) end)))))

(define (explore-unicode start)
  (list->string (unicode-string start (+ start 50))))

; Prefix
(define (prefix/count s n b)
  (cond
    [(>= n b) (cons s empty)]
     (else (cons (substring s 0 n)
           (prefix/count s (add1 n) b)))))

(define (prefixes s)
  (prefix/count s 0 (string-length s)))

;; (common a b c n) produces true if and only if n is a factor of
;; all of a, b and c.
; common? Nat Nat Nat Nat -> Bool
(define (common? a b c n)
  (and
   (zero? (remainder a n))
   (zero? (remainder b n))
   (zero? (remainder c n))))

(define (gcd-three/count a b c k)
  (cond
    ((common? a b c k) k)
    (else (gcd-three/count a b c (sub1 k)))))

(define (gcd-three a b c)
  (gcd-three/count a b c (min a b c)))

;; Linear insertion sort

(define (mysort lon)
  (cond
    [(empty? lon) empty]
    (else (insert (first lon)(mysort (rest lon))))))

;; insert: Num (listof Num) -> (listof Num)
;; requires: lon is already sorted
(define (insert n lon)
  (cond
    [(empty? lon) (cons n empty)]
    [(>= n (first lon)) (cons n lon)] ;greater than or less than will affect smallest to largest or vice versa
    [else (cons (first lon) (insert n (rest lon)))]))

(define (make-rand n)
  (cond
    [(zero? n) empty]
    [else (cons (random 1000) (make-rand (sub1 n)))]))

;; A Student is a (list Str Num Num Num) <- not (listof) which is open ended
;; Where:
;; * The first item is the name of the student
;; * The second item is the assignment grade
;; * The third item is the midterm grade
;; * The fourth item is the exam grade
;; * and all grades are between 0 and 100, inclusive

;; "Constructor" function
;; make-student: Str Num Num Num -> Student
(define (make-student name assignment mid final)
  (list name assignment mid final))

;; "Selectors" Select a field
;; student-name: Student -> Str
(define (student-name s) (first s))
(define (student-assignments s) (second s))
(define (student-midterm s) (third s))
(define (student-final s) (fourth s))

(define cs115
  (list
   (make-student "Virginia Woolf" 100 100 100)
   (make-student "Alan Turing" 90 80 40)))

;; name-list: (listof Student) -> (listof Str)
(define (name-list los)
  (cond
    [(empty? los) empty]
    [else (cons (student-name (first los))
                (name-list (rest los)))]))

;; Dictionary: "Abstract data type": Here are the behaviours
;; Association List: Data Structures

;; An Association List is (list Num Str)
;; where
;; * the first item is the key,
;; * the second item is the associated value