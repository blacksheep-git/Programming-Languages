; Student: Mateo Ortegon
; Assignment: LA1
; Date: Feb 08 2022
(define RANDOM (lambda () (random 100)))
(define (replace repl)
	(if (null? repl)
		'()
		(if (list? repl)
			(cons (replace (car repl)) (replace (cdr repl)))
			(if (eq? repl (car '(RANDOM)))
				(RANDOM)
				repl
			)
	  )
	)
)

(define (tsar subj srch repl)
	(cond 
		((null? subj)   ; if list is empty
			'())             
		((list? subj)   ; else if 'subj' is a list
			(if (eq? subj srch) 
  			(replace repl)
				(cons (tsar (car subj) srch repl) (tsar (cdr subj) srch repl))
			)) 
  	((eq? subj srch) 
  		(replace repl))
  	(else
			subj
		)
	)
)



; Tests
(define x 1)
(define y 2)
(define z 3)

(define (result out exp)
	(display "Output: ") (display out)
	(display "\nExpected: ") (display exp)
	(display "\n")
	
	(if (equal? out exp)
		(display "PASS")
		(display "FAIL")
	)
	(display "\n")
	(display "\n")
)


(display "(tsar 'z 'x 'y) => z \n")
(result (tsar 'z 'x 'y) 'z)

(display "(tsar 'x 'x 'y) => y \n")
(result (tsar 'x 'x 'y) 'y)

(display "(tsar 'x 'x 'x) => x \n")
(result (tsar 'x 'x 'x) 'x)

(display "(tsar '() 'x 'y) => () \n")
(result (tsar '() 'x 'y) '())

(display "(tsar '(x x) 'x 'y) => (y y) \n")
(result (tsar '(x x) 'x 'y) '(y y))

(display "(tsar '(x (x) z) 'x 'y) => (y (y) z) \n")
(result (tsar '(x (x) z) 'x 'y) '(y (y) z))

(display "(tsar '(x (x) z) '(x) '(y y)) => (x (y y) z) \n")
(result (tsar '(x (x) z) '(x) '(y y)) '(x (y y) z))

(display "(tsar '(x (x) ((x)) z) '(x) '(y y)) => (x (y y) ((y y)) z) \n")
(result (tsar '(x (x) ((x)) z) '(x) '(y y)) '(x (y y) ((y y)) z))

(display "(tsar '(x (x) ((x)) z) '(x) '()) => (x () (()) z) \n")
(result (tsar '(x (x) ((x)) z) '(x) '()) '(x () (()) z))

(display "(tsar '(x (x) ((x)) z) '() '(y y)) => (x (x) ((x)) z) \n")
(result (tsar '(x (x) ((x)) z) '() '(y y)) '(x (x) ((x)) z))

(display "(tsar '(x (x) ((x)) z) '(x) '(RANDOM y)) => (x (74 y) ((46 y)) z) \n")
(result (tsar '(x (x) ((x)) z) '(x) '(RANDOM y)) '(x (74 y) ((46 y)) z))


(display "(tsar '(x (x) ((x)) z) '(x) '(RANDOM RANDOM)) => (x (76 76) ((63 63)) z) \n")
(result (tsar '(x (x) ((x)) z) '(x) '(RANDOM RANDOM)) '(x (76 76) ((63 63)) z))


