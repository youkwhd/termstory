#lang racket

(require "list.rkt")
(require "char.rkt")

(define (remove-non-numeric-string str)
  (list->string (list-cons-if (string->list str) is-numeric-char)))

(provide (all-defined-out))
