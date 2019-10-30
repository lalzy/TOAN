;;;; toan.asd

(asdf:defsystem #:toan
  :description "Describe toan here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:iterate #:cl-utilities #:cl-ppcre)
  :serial t
  :components ((:file "package")
	       (:file "init")
	       (:file "i-o")
               (:file "toan")))

; (cl-ppcre:regex-replace-all "qwer" "something to qwer" "replace")
