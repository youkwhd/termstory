#lang racket

(define (is-numeric-char ch)
  (and (>= (char->integer ch) 48) (<= (char->integer ch) 57)))

(provide (all-defined-out))
