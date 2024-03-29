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

(define (not_empty lis) (not(eq? lis '()))) ; Used to determine if a list is empty
(define (member atm lis)
  (cond
    ((null? lis) #f) ;; empty list
    ((eq? atm (car lis)) #t)
    (else (member atm (cdr lis)))
  )
)

(define (helper atm L)
  (cond
    ((and (null? L) (null? atm) 0)) ; If both are null, return 0
    ((and (null? L) (list? atm) 0)) ; if atm is a list, return 0
    ((and (list? atm) (list? L) (not_empty L)) (helper (car L) (cdr L))) ; If list is non empty, call helper
    ((and (null? atm) (list? L) (not_empty L)) (helper (car L) (cdr L))) ; if list is non empty, call helper 
    ((and (not(number? atm)) (not_empty L) (list? L)) (helper (car L) (cdr L))) ; if atm is in [a-z], call helper 
    ((and (number? atm) (null? L)) atm) ; If atm not in [a-z] and L is null, return atm 
    ((and (number? atm) (list? L)) (+ atm (helper (car L) (cdr L)))) ; Normal case
   (else 0)
  )
)

(define (sum-up-numbers-simple L)
  (cond 
    ((null? L ) 0) ; If the list is empty, return 0
    ((list? L) (helper (car L) (cdr L))) ; If L is a list, call helper
    (else 0) ; Else return 0
  )
)

;;; Problem 3
;;; This function is a modification of problem 2.

(define (sum-up-numbers-general L)
  (cond 
    ((null? L ) 0) ; If the list is empty, return 0
    ((list? L) (helper2 (car L) (cdr L))) ; If L is a list, call helper
    (else 0) ; Else return 0
  )
)

; NOTE  
; Since this code is very similar to the one above it,
;I didn't break out the commits for this function
(define (helper2 atm L)
  (cond
    ((and (null? L) (null? atm) 0)) ; If both are null, return 0
    ((and (list? atm) (not_empty atm) (list? L) (not_empty L)) (+ (helper2 (car atm) (cdr atm)) (helper2 (car L) (cdr L))))
    ((and (null? L) (list? atm) (not_empty atm)) (helper2 (car atm) (cdr atm))) 
    ((and (list? atm) (list? L) (not_empty L)) (helper2 (car L) (cdr L))) ; If list is non empty, call helper
    ((and (null? atm) (list? L) (not_empty L)) (helper2 (car L) (cdr L))) ; if list is non empty, call helper 

    ((and (not(number? atm)) (not_empty L) (list? L)) (helper2 (car L) (cdr L))) ; if atm is in [a-z], call helper 
    ((and (number? atm) (null? L)) atm) ; If atm not in [a-z] and L is null, return atm 
    ((and (number? atm) (list? L)) (+ atm (helper2 (car L) (cdr L)))) ; Normal case

   (else 0)
  )
)
