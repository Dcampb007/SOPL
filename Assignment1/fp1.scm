#| 
Andre Campbell
Functional Programming 1
|#

;;; Problem 1
(define (reverse-general L)
  (cond ((null? L) '()) ; if L is null, return empty list
        ((list? L)
          ;;; append the first item to the end of the list
          ;;; recursive call
          (append (reverse-general (cdr L)) 
              (list (reverse-general (car L))) 
            )
        )
        (else L) ; else return L
    )
 )