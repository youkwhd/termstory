#lang racket

(define (clear-terminal-screen)
  (displayln "\033c"))

(provide (all-defined-out))
