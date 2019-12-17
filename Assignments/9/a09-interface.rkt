;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname a09_interface) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; A09 interface file

;; For use in Q1 and Q2

(define-struct auto (brand power fuel))
;; An Auto is a (make-auto Str Num Num)
;; brand is the brand/manufacturer of the auto
;; power is the horsepower of the car, measured in hp
;; fuel is the fuel efficiency of the car, measured in L/100km
;; requires:
;;   power >= 0
;;   fuel >= 0

;; Some constants that may be useful in testing
(define car1 (make-auto "Toyota" 45 34.2))
(define car2 (make-auto "Apple" 33 1098))
(define car3 (make-auto "Boo" 100 100))
(define car4 (make-auto "Toyota" 5 4.2))
(define car5 (make-auto "Toyota" 8 2.2))
(define cars (list car1 car2 car3 car4 car5))


;; Q1 header
(define (find-auto mybrand minpower maxfuel loa) ...)

;; Q2 header
(define (best-auto loa) ...)

;; For use in Q3

(define-struct course (subject number title))
;; A Course is a (make-course Sym Nat Str)
;; where:
;; subject is the subject area of the course
;; number is the course number of the course
;; title is the descriptive title describing the content of the course
  
(define-struct student (id name age courses))
;; A Student is a (make-student Nat Str Nat (listof Course))
;; where:
;; id is the unique student id for the student
;; name is the name of the student
;; age is the age of the student
;; courses is a list, with one element for each different course
;; the student is enrolled in

;; Some constants useful for testing              
(define cs115 (make-course 'CS 115 "Intro to CS"))
(define cs135 (make-course 'CS 135 "Intro to CS"))
(define music115 (make-course 'MUSIC 115 "Pop Music"))
(define math135 (make-course 'MATH 135 "Logic and Proofs"))
(define phys121 (make-course 'PHYS 121 "Mechanics 1"))
(define chem135 (make-course 'CHEM 135 "Explosive Materials II"))

(define stu1 (make-student 213432 "Troy" 22 (list cs115 math135 phys121)))
(define stu2 (make-student 321413 "Sandy" 23 (list cs115 phys121)))
(define stu3 (make-student 325423 "Lori" 24 (list math135 phys121)))
(define stu4 (make-student 312334 "Valentina" 19 (list math135 cs135 music115)))
(define stu5 (make-student 100000 "Nobody" 29 empty))
(define stu6 (make-student 200000 "Lefty" 30 (list chem135 phys121)))
(define students (list stu1 stu2 stu3 stu4 stu5 stu6))

;; Q3 header
(define (students-in-course coursesub coursenum los) ...)