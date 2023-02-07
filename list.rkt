#lang racket

(define (list-cons-if lst lmbda)
  (cond
    [(empty? lst) empty]
    [(lmbda (first lst)) (cons (first lst) (list-cons-if (rest lst) lmbda))]
    [(list-cons-if (rest lst) lmbda)]))

(provide (all-defined-out))
