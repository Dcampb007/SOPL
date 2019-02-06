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

;;; Problem 2
;;; This function expects a list as the parameter
;;; if a list is not provided, it will return 0
(define (sum-up-numbers-simple L)
  (cond 
    ((null? L ) 0) ; If the list is empty, return 0
    (list? (helper (car L) (cdr L))) ; If L is a list, call helper
    (else 0) ; Else return 0
  )
)