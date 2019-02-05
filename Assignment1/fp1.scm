#| 
Andre Campbell
Functional Programming 1
|#
(define (reverse-general L)
  (cond ((null? L) '()) ; if L is null, return empty list
        ((list? L)
          ;;; handle reversal of list
        )
        (else L) ; else return L
    )
 )
(display (reverse-general '()))