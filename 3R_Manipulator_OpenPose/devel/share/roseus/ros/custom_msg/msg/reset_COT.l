;; Auto-generated. Do not edit!


(when (boundp 'custom_msg::reset_COT)
  (if (not (find-package "CUSTOM_MSG"))
    (make-package "CUSTOM_MSG"))
  (shadow 'reset_COT (find-package "CUSTOM_MSG")))
(unless (find-package "CUSTOM_MSG::RESET_COT")
  (make-package "CUSTOM_MSG::RESET_COT"))

(in-package "ROS")
;;//! \htmlinclude reset_COT.msg.html


(defclass custom_msg::reset_COT
  :super ros::object
  :slots (_reset_COT ))

(defmethod custom_msg::reset_COT
  (:init
   (&key
    ((:reset_COT __reset_COT) nil)
    )
   (send-super :init)
   (setq _reset_COT __reset_COT)
   self)
  (:reset_COT
   (&optional __reset_COT)
   (if __reset_COT (setq _reset_COT __reset_COT)) _reset_COT)
  (:serialization-length
   ()
   (+
    ;; bool _reset_COT
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reset_COT
       (if _reset_COT (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reset_COT
     (setq _reset_COT (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get custom_msg::reset_COT :md5sum-) "8be9f92adaf46f35e0791e11db65f1f5")
(setf (get custom_msg::reset_COT :datatype-) "custom_msg/reset_COT")
(setf (get custom_msg::reset_COT :definition-)
      "bool reset_COT

")



(provide :custom_msg/reset_COT "8be9f92adaf46f35e0791e11db65f1f5")


