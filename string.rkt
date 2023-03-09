#lang racket

(require "char.rkt")

(define (remove-non-numeric-string str)
  (list->string (filter (string->list str) is-numeric-char)))

(provide (all-defined-out))
