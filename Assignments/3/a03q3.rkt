;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname a03q3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;
;; **********************
;; Zidong Liu (20626047)
;; CS 115
;; Assignment 03, Question 3
;; **********************

;; (same?) produces a boolean value depending on whether a b c are the same
;; same?: Any -> Bool

;; Examples:
(check-expect(same? "a" 19 "a")false)
(check-expect(same? "c" "c" "c")true)

(define (same? a b c)
  (and (equal? a b) (equal? a c)))
;;

(define(unfinished? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (or(equal? s1 " ")
     (equal? s2 " ")
     (equal? s3 " ")
     (equal? s4 " ")
     (equal? s5 " ")
     (equal? s6 " ")
     (equal? s7 " ")
     (equal? s8 " ")
     (equal? s9 " ")))

;; (win1?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the first column vertically
;; win1?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win1? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s1 s2 s3) (not(equal? s1 " "))))

;; (win2?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the second column vertically
;; win2?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win2? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s4 s5 s6) (not(equal? s4 " "))))

;; (win3?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the third column vertically
;; win3?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win3? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s7 s8 s9) (not(equal? s7 " "))))

;; (win4?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the first row horizontally
;; win4?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win4? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s1 s4 s7) (not(equal? s1 " "))))

;; (win5?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the second row horizontally
;; win5?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win5? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s2 s5 s8) (not(equal? s2 " "))))

;; (win6?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the third row horizontally
;; win6?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win6? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s3 s6 s9) (not(equal? s3 " "))))

;; (win7?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the left to right diagonal
;; win7?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win7? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s1 s5 s9) (not(equal? s1 " "))))

;; (win8?) produces a boolean value if s1 s2 s3 s4 s5 s6 s7 s8 s9 contain values
;; which satisfy the tic-tac-toe win condition 3 in a row in the right to left diagonal
;; win8?: Str Str Str Str Str Str Str Str Str -> Bool
(define (win8? s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (and (same? s3 s5 s7) (not(equal? s1 " "))))


;;(tic-tac-toe-win) produces the winner of a game played with s1 s2 s3 s4 s5 s6 s7 s8 s9
;; as inputs, "T" if there is a tie, and "U" if the game is unfinished
;; tic-tac-toe-win: Str Str Str Str Str Str Str Str Str -> Str

;; Examples:
(check-expect(tic-tac-toe-win "X" "O" "O"
                              "O" "O" "X"
                              "O" "X" " ")"O")

(check-expect(tic-tac-toe-win " " "O" " "
                              "O" "X" "O"
                              "O" "X" "O")"U")

(check-expect(tic-tac-toe-win "X" "X" "X"
                              "O" "X" "O"
                              "O" "O" " ")"X")

(check-expect(tic-tac-toe-win "X" "O" "X"
                              "O" "O" "X"
                              "X" "X" "O")"T")

(define (tic-tac-toe-win s1 s2 s3 s4 s5 s6 s7 s8 s9)
  (cond
    ((win1? s1 s2 s3 s4 s5 s6 s7 s8 s9)s1)
    ((win2? s1 s2 s3 s4 s5 s6 s7 s8 s9)s4)
    ((win3? s1 s2 s3 s4 s5 s6 s7 s8 s9)s7)
    ((win4? s1 s2 s3 s4 s5 s6 s7 s8 s9)s1)
    ((win5? s1 s2 s3 s4 s5 s6 s7 s8 s9)s2)
    ((win6? s1 s2 s3 s4 s5 s6 s7 s8 s9)s3)
    ((win7? s1 s2 s3 s4 s5 s6 s7 s8 s9)s1)
    ((win8? s1 s2 s3 s4 s5 s6 s7 s8 s9)s3)
    ((unfinished? s1 s2 s3 s4 s5 s6 s7 s8 s9)"U")
    (else "T")))

;; Tests:
(check-expect(tic-tac-toe-win " " " " " "
                              " " " " " "
                              " " " " " ")"U")