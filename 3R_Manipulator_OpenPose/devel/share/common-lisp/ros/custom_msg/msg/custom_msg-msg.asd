
(cl:in-package :asdf)

(defsystem "custom_msg-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "reset_COT" :depends-on ("_package_reset_COT"))
    (:file "_package_reset_COT" :depends-on ("_package"))
    (:file "set_angles" :depends-on ("_package_set_angles"))
    (:file "_package_set_angles" :depends-on ("_package"))
    (:file "status_arm" :depends-on ("_package_status_arm"))
    (:file "_package_status_arm" :depends-on ("_package"))
  ))