(in-package #:toan)

(defun start-window ()
  (with-ltk ()
    (let* ((text nil)))))

(defun change-tales (tale other gender)
  "Loop over and replace other and gender inside the tales"
  (let ((new-tale
    (cl-ppcre:regex-replace-all "{other}" 
				(cl-ppcre:regex-replace-all "{gender}" tale gender)
				other)))
    new-tale))



(defmacro get-input  (text condition fail-text  &aux (input-name (gensym)) )
 ; (block input-block
    `(let ((,input-name))
       (format t "~%~a~%>> " ,text)
       (iter
	 (setf ,input-name (read))
	 (if (funcall ,condition ,input-name)
	     (leave  ,input-name)
	     (format t "~%~a~%>> " ,fail-text)))));)


(defun get-action-list (letter rm)
  "function to get the action(top-row) of the reaction matrices"
  (cadr (assoc letter rm)))

(defun get-encounter-list (letter rm)
  "function to get the 'encounter'(side-row) of the reacion matrices"
  (caddr (assoc letter rm)))

(defun display-list (letter rm type  &aux list)
  "function used to display a list of the reaction matrices, for the sake of menu selection."
  (cond ((equal type 'action)
	 (setf list (get-action-list letter rm)))
	((equal type 'encounter)
	 (setf list (get-encounter-list letter rm))))

  (if list
      (iter (for e in list)
	    (for i from 0 to (length list))
	    (format t "[~a] - ~a~%" i e))
      (error "invalid list Error[display]")))


(defun selection (letter rm type &aux  (list (cond ((equal type 'action)
						    (get-action-list letter rm))
						   ((equal type 'encounter)
						    (get-encounter-list letter rm))
						   (t 'error))))
  "Selection menu, shows the relevant menu(action\encounter), and allow user to choose a selection,
returns the input back(number)"
  (when (equal list 'error)
    (error "wrong-list-type"))

  (get-input (progn (display-list letter rm type) "Choose action")
      #'(lambda (input)
	  (if (and (>= input 0)
		   (< input (length list)))
	      input
	      nil))
      "Not a valid selection"))
  
(defun commands ()
  "list of commands user can use in repl"
  (format t "Commands:
exit - exists
load [path] - Loads up a lisp file. primarily for use with loading up book-of-tales lists
Create-player [name] [skills]
add-skill [skill] 
add-skills [skills]
remove-skill[skill]
remove-skills[skills]

get-index - start the index-checking
get-book [index][player] - Get book entry and does a skill-check for outcome

---
[name] is the character name
[skill] is a skillname
[skills] is one or more skills.
example:
    create-player Lars courtly-graces magic luck
Creates a player named Lars, with theskills Courtly graces, Magic and Luck.  
Space is not supported so you need a - connecting the words.
"))


(defun repl (&aux inputs command)
  "input repl"
  (iter
  (format t "~%Enter a command:~%>> ")
  
  (setf command (read-line))
  (setf inputs (conv-str-sym (cdr (cl-utilities:split-sequence #\space command))))
  (setf command (car (cl-utilities:split-sequence #\space command)))
  
  (cond ((or (equal command "exit") (equal command "quit"))
	 (when *exe-exit*
	   (ccl:quit))
	 (return))

	((or (equal command "command")
	       (equal command "commands")
	       (equal command "help"))
	   (commands))
	  
	((equal command "create-player")
	 (create-player (first inputs) (cdr inputs)))

	((or (equal command "select-player") (equal command "s-p"))
	 ;Show list of players, allow selection
	 ())
	
	((equal command "add-skill")
	 (adding-skills (first inputs) (cdr inputs)))

	((equal command "add-skills")
	 (adding-skills (first inputs) (cdr inputs)))

	((or (equal command "get-index") (equal command "gi"))
	 (iter (while (not (equal (start-index) 'exit)))))

	((or (equal command "automated-book") (equal command "ab"))
	 (book-checking))
	
	((equal command "get-book")
	 (start-book))

	((equal command "error-check")
	 (error "error check complete!"))
	
	((equal command "load")
	   (if (> (length inputs) 0)
	       (load-book-of-tales inputs)
	       (load-book-of-tales))
	 (setf *book-of-tales-p* t))

	(t (format t "~%invalid command. Type help for a list of commands~%~%")))))
