;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Module 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define(taylor-swift x)(+ (sqr x)(* 4 x)2))
(define(sum-of-cubes a b c)(+ (expt a 3)(expt b 3)(expt c 3)))

(define a-constant 17)
(define G 6.67e-11)