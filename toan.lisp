;;;; toan.lisp

(in-package #:toan)

;;; "toan" goes here. Hacks and glory await!



;;; HowItShouldRun:
;;;     Ask for paragraph
;;;     Ask for dice-result
;;;     -> Automatically move to index letter, and encounter-term
;;;     -> Ask for action chosen
;;;     -> Ask for destiny result(+-#), return index number.


;; To work on:
;;     Player Switch Command(list of players, select one)
;;     Remove skill from player
;;      Master skill system(players get to select outcome)
;;      Mandatory System
;;      Status System

;;; If book of tales, automatically go to index and return result.
;;; Change skill list to reflect having skills, status and items.
;;; 




(defun debug-message (message inputs)
  (when *debug* (format t "~a ~{~a ~}~%~%" message inputs)))

(defun valid-paragraph-p (para)
  (if (or (and (numberp para)
	       (or (and (> para 0) (<= para 88))
		   (and (>= para 90) (<= para 95))
		   (and (>= para 97) (<= para 102))
		   (and (>= para 105) (<= para 110))
		   (and (>= para 113) (<= para 121))))
	  (equal para 'exit)
	  (equal para 'back)
	  (equal para 'quit)
	  (member para '(a b c d e f g h i j k l m n o)))
      t
      nil))

;;; Check if valid paragraph, if valid, check if it's N, if so skip paragraph step and go right to index-letter(N)


(defun get-index (ac en letter l-list)
  "Get the index number from the reaction matrices based on action done, encounter and what letter"
  (nth en (nth ac (cdr (assoc letter l-list)))))


(defun skill-check (skills index t-list &aux (text (book-text 'no-skill index t-list)))
  "loop through skill list and checks it against needed skills"
  (iter (for skill in skills)
	(when (check-skill skill index t-list)
	  (setf text (book-text 'skill index t-list))))
  text)


(defun check-skill (skill index t-list)
  "check a skill against required skills in book of tales for current index"
  (if (member skill (cdr (assoc 'skill (cdr (assoc index t-list)))))
      t
      nil))

(defun book-text (return-text index t-list)
  "Display text from book of tales.
Return-text: 
   Desc - returns main text
   skill - returns successfull skill check text
   no-skill - returns failed skill check text

Index: Paragraph Index
t-list: Book of tales list"
  (car (last (assoc return-text (cdr (assoc index t-list))))))

(defun get-player-skill-list (player player-list)
  "Gets chosen player's list of skills"
  (cadr (assoc player player-list)))

(defun load-book-of-tales (&optional (path "book-of-tales.lisp"))
  "loads up book-of-tales lisp file, replaces the need for the book of tales"
  (load path))


(defun create-player (name skills)
  "creates a player."
  (unless (listp skills)
    (setf skills (list skills)))
  (push (list name skills) *players*))


(defun conv-str-sym (input)
  "converts a string to a symbol, or a list of strings to a list of symbols"
  (if (listp input)
      (progn
	(let ((list))
	  (iter (for el in input)
		(push (read-from-string el) list))
	  (reverse list)))
      (read-from-string input)))

(defun adding-skills (name skills)
  "Add new skill to user"
  (unless (listp skills)
    (setf  skills (list skills)))
  
  (if (assoc name *players*)
      (iter (for skill in skills)
	    (push skill (cadr (assoc name *players*))))
      (format t "No such player exist~%")))


(defun removing-skills (name skills)
  "Removes skills")


(defun start-book ())


(defun get-paragraph (para para-num )
  "Gets the paragraph result from the paragraph list"
  (cdr (assoc para-num (cdr (assoc para *paragraphs*)))))

(defun start-paragraph ()
  "Runs through paragraph selection, and returns an index letter and encounter keyword"
  (let* ((para (get-input "Enter paragraph number or index letter:" #'valid-paragraph-p "Invalid Paragraph or index letter!"))
	 (para-num (unless (or (equal para 'exit) (equal para 'back) (member para '(a b c d e f g h i j k l m n o)) )
		     (get-input "Enter Paragraph Result: "
			 #'(lambda (input)
			     (if (and (> input 0) (<= input 12)) t nil))
			 "Invalid Paragraph Result(1-12)!"))))
    (cond ((equal para 'exit)
	   'exit)
	  ((car (member para '(a b c d e f g h i j k l m n o))))
	(t (get-paragraph para para-num )))))

(defun split-encounter (enc)
  "splits up encounter string into a list of 2 elements"
  (cl-utilities:split-sequence #\space enc))

(defun get-encounter-pos (letter encounter &aux (enc-list (get-encounter-list letter *r-m*)))
  "Get the numeric position of an encounter"
 ; (format t "letter = [~a]~%~%" letter)
  (debug-message "letter = " `(,letter))
  (iter (for pos from 0 to (length enc-list))
;	(format t "encounter=[~a]~%" (nth pos enc-list))
	(debug-message "encounter=" `(,(nth pos enc-list)))
	(when (equal (nth pos enc-list) encounter)
	  (debug-message "chosen encouter = " `( ,(nth pos enc-list) ,pos))
	 ; (format t "~%chosen encounter = ~a~%pos = [~a]~%" (nth pos enc-list) pos)
	  (leave pos))
	))


(defun test (player player-list index t-list)
  (skill-check (get-player-skill-list player player-list) index t-list))

(defun switch-player ()
  (when (> (length *players*) 1)
    (format t "switch-system"))
  (book-checking))

(defun book-checking ()
  "Automatic checks the book of tales, based on selected players skills and index"
  (let* ((index (start-index)))
    (format t "~%~a~%~%> ~a~%" (book-text 'desc index *book-of-tales*)
	    (skill-check (get-player-skill-list *player* *players*) index *book-of-tales*))))

  

;; Make Exception for > 83
(defun start-index ()
  "Runs trough paragraph selection and get an index returned"
  (block testy
    (let* ((paragraph (start-paragraph))
	   (selection nil)
	   (letter (cond ((member paragraph '(a b c d e f g h i j k l m n o))
			  (setf selection t)
			  paragraph)
			 
			 ((equal paragraph 'exit)
			  (return-from testy 'exit))
			 (t (debug-message "paragraph = " `(,paragraph))
			  (second paragraph))))
	   (encounter (cond (selection
			     (selection letter *r-m* 'encounter))
			    (t(get-encounter-pos letter (conv-str-sym (first (split-encounter (first paragraph))))))))

	   (action (progn
		     (format t "~%You meet a \"")
		     (if (equal paragraph 'n)
			 (format t "~a" (nth encounter (get-encounter-list paragraph *r-m*)))
			 (format t "~a" (first paragraph)))
		     (format t "\", how do you respond?~%")
		     (selection letter *r-m* 'action)))
	     
	   (index (progn (unless encounter (error "Encounter doesn't exist, encounter is valued nil."))
			 (get-index action encounter letter *Index-list*))))

      (format t "~%Index = [~a]" index)
      (when *destiny-dice-p*
	(setf index (destiny-check index))
	(format t " - after destiny die: [~a]~%" index))
      index)))

(defun destiny-check (index &aux (rand (random 3)))
  (cond ((= rand 0)
	 (- index 1))
	((= rand 2)
	 (+ index 1))
	(t index)))

   ;; (book-text 'desc index *book-of-tales*)
   ;;  (skill-check (get-player-skill-list player *players*) index *book-of-tales*)
    
(defun main (&optional player)
  (in-package :toan)
  (commands)
  (repl))

(defun init ()
  (when *debug*
    (setf *players* '((skn (quick-thinking)) (ph (magic))))))

    ;(format t "letter = [~a] | action = [~a] | encounter =  [~a]" letter action encounter)))

;; (get-input "enter paragraph number" #'(lambda (input)
;;					(if (and (>= input 0)
;;						 (<= input 5))
;;					    t
;;					    nil))
;;
 ;;   "Invalid Paragraph")
