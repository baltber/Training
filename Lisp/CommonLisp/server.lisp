;; Micro-framework for building API
(ql:quickload :ningle)
;; Now ningle is installed and we need to install a clack which is analog of WSGI
;; stack from Python
;; I've pressed C-c C-c to eval this form
(ql:quickload :clack)

;; To parse json:
(ql:quickload :jonathan)

(defvar *app* (make-instance 'ningle:<app>))

(setf (ningle:route *app* "/")
      ;; in case, if you need to parse or serialize JSON,
      ;; use Jonthan library.
      (jonathan:to-json '(:foo 100500)))

(defvar *server* nil
  "This variable will store currently running server instance.")

(defun start ()
  (if *server*
      (format t "Server already started")
      (setf *server*
        (clack:clackup *app*))))

(defun stop ()
  (if *server*
      (clack:stop *server*)
      (format t "Server is not running")))
