;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname l05q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Lab 05, Question 3
;; **********************


;; Examples:
(check-expect(longest-string-length
              (cons "Hello" (cons "World!" (cons "" (cons "Pasloe" empty)))))6)

(define (longest-string-length los)
  (cond
    ((empty? los) 0)
    (else (max (string-length (first los)) (longest-string-length (rest los))))))




  
        

