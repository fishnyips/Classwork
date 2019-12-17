;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |Labs practice|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define (middle-digit nnn)
  (remainder (quotient nnn 10) 10))

(define (set-middle-to-zero nnn)
  (- nnn (* (middle-digit nnn) 10)))

(define (last-char str)
  (substring str (- (string-length str) 1)))

(define (shipping-bill handling charge-per-kg weight boxes)
  (+ handling (* charge-per-kg weight boxes)))

(define (airport-parking day-num)
  (+ (* (quotient day-num 7) 74.95)
     (* (remainder day-num 7) 14.95)))

(define (clips-cost c bp disc)
  (+ (* (min c bp) 100)
     (* (max (- c bp) 0) (- 1 disc) 100)))