;; Auto-generated. Do not edit!


(when (boundp 'custom_msg::set_angles)
  (if (not (find-package "CUSTOM_MSG"))
    (make-package "CUSTOM_MSG"))
  (shadow 'set_angles (find-package "CUSTOM_MSG")))
(unless (find-package "CUSTOM_MSG::SET_ANGLES")
  (make-package "CUSTOM_MSG::SET_ANGLES"))

(in-package "ROS")
;;//! \htmlinclude set_angles.msg.html


(defclass custom_msg::set_angles
  :super ros::object
  :slots (_set_OMB _set_COT _set_PUN _set_GAR _reset _retry _emergency_stop _set_Kp_PUN _set_Ki_PUN _set_Kd_PUN _set_Kp_OMB _set_Ki_OMB _set_Kd_OMB _set_Kp_GAR _set_Ki_GAR _set_Kd_GAR ))

(defmethod custom_msg::set_angles
  (:init
   (&key
    ((:set_OMB __set_OMB) 0.0)
    ((:set_COT __set_COT) 0.0)
    ((:set_PUN __set_PUN) 0.0)
    ((:set_GAR __set_GAR) nil)
    ((:reset __reset) nil)
    ((:retry __retry) nil)
    ((:emergency_stop __emergency_stop) nil)
    ((:set_Kp_PUN __set_Kp_PUN) 0.0)
    ((:set_Ki_PUN __set_Ki_PUN) 0.0)
    ((:set_Kd_PUN __set_Kd_PUN) 0.0)
    ((:set_Kp_OMB __set_Kp_OMB) 0.0)
    ((:set_Ki_OMB __set_Ki_OMB) 0.0)
    ((:set_Kd_OMB __set_Kd_OMB) 0.0)
    ((:set_Kp_GAR __set_Kp_GAR) 0.0)
    ((:set_Ki_GAR __set_Ki_GAR) 0.0)
    ((:set_Kd_GAR __set_Kd_GAR) 0.0)
    )
   (send-super :init)
   (setq _set_OMB (float __set_OMB))
   (setq _set_COT (float __set_COT))
   (setq _set_PUN (float __set_PUN))
   (setq _set_GAR __set_GAR)
   (setq _reset __reset)
   (setq _retry __retry)
   (setq _emergency_stop __emergency_stop)
   (setq _set_Kp_PUN (float __set_Kp_PUN))
   (setq _set_Ki_PUN (float __set_Ki_PUN))
   (setq _set_Kd_PUN (float __set_Kd_PUN))
   (setq _set_Kp_OMB (float __set_Kp_OMB))
   (setq _set_Ki_OMB (float __set_Ki_OMB))
   (setq _set_Kd_OMB (float __set_Kd_OMB))
   (setq _set_Kp_GAR (float __set_Kp_GAR))
   (setq _set_Ki_GAR (float __set_Ki_GAR))
   (setq _set_Kd_GAR (float __set_Kd_GAR))
   self)
  (:set_OMB
   (&optional __set_OMB)
   (if __set_OMB (setq _set_OMB __set_OMB)) _set_OMB)
  (:set_COT
   (&optional __set_COT)
   (if __set_COT (setq _set_COT __set_COT)) _set_COT)
  (:set_PUN
   (&optional __set_PUN)
   (if __set_PUN (setq _set_PUN __set_PUN)) _set_PUN)
  (:set_GAR
   (&optional __set_GAR)
   (if __set_GAR (setq _set_GAR __set_GAR)) _set_GAR)
  (:reset
   (&optional __reset)
   (if __reset (setq _reset __reset)) _reset)
  (:retry
   (&optional __retry)
   (if __retry (setq _retry __retry)) _retry)
  (:emergency_stop
   (&optional __emergency_stop)
   (if __emergency_stop (setq _emergency_stop __emergency_stop)) _emergency_stop)
  (:set_Kp_PUN
   (&optional __set_Kp_PUN)
   (if __set_Kp_PUN (setq _set_Kp_PUN __set_Kp_PUN)) _set_Kp_PUN)
  (:set_Ki_PUN
   (&optional __set_Ki_PUN)
   (if __set_Ki_PUN (setq _set_Ki_PUN __set_Ki_PUN)) _set_Ki_PUN)
  (:set_Kd_PUN
   (&optional __set_Kd_PUN)
   (if __set_Kd_PUN (setq _set_Kd_PUN __set_Kd_PUN)) _set_Kd_PUN)
  (:set_Kp_OMB
   (&optional __set_Kp_OMB)
   (if __set_Kp_OMB (setq _set_Kp_OMB __set_Kp_OMB)) _set_Kp_OMB)
  (:set_Ki_OMB
   (&optional __set_Ki_OMB)
   (if __set_Ki_OMB (setq _set_Ki_OMB __set_Ki_OMB)) _set_Ki_OMB)
  (:set_Kd_OMB
   (&optional __set_Kd_OMB)
   (if __set_Kd_OMB (setq _set_Kd_OMB __set_Kd_OMB)) _set_Kd_OMB)
  (:set_Kp_GAR
   (&optional __set_Kp_GAR)
   (if __set_Kp_GAR (setq _set_Kp_GAR __set_Kp_GAR)) _set_Kp_GAR)
  (:set_Ki_GAR
   (&optional __set_Ki_GAR)
   (if __set_Ki_GAR (setq _set_Ki_GAR __set_Ki_GAR)) _set_Ki_GAR)
  (:set_Kd_GAR
   (&optional __set_Kd_GAR)
   (if __set_Kd_GAR (setq _set_Kd_GAR __set_Kd_GAR)) _set_Kd_GAR)
  (:serialization-length
   ()
   (+
    ;; float32 _set_OMB
    4
    ;; float32 _set_COT
    4
    ;; float32 _set_PUN
    4
    ;; bool _set_GAR
    1
    ;; bool _reset
    1
    ;; bool _retry
    1
    ;; bool _emergency_stop
    1
    ;; float32 _set_Kp_PUN
    4
    ;; float32 _set_Ki_PUN
    4
    ;; float32 _set_Kd_PUN
    4
    ;; float32 _set_Kp_OMB
    4
    ;; float32 _set_Ki_OMB
    4
    ;; float32 _set_Kd_OMB
    4
    ;; float32 _set_Kp_GAR
    4
    ;; float32 _set_Ki_GAR
    4
    ;; float32 _set_Kd_GAR
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _set_OMB
       (sys::poke _set_OMB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_COT
       (sys::poke _set_COT (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_PUN
       (sys::poke _set_PUN (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _set_GAR
       (if _set_GAR (write-byte -1 s) (write-byte 0 s))
     ;; bool _reset
       (if _reset (write-byte -1 s) (write-byte 0 s))
     ;; bool _retry
       (if _retry (write-byte -1 s) (write-byte 0 s))
     ;; bool _emergency_stop
       (if _emergency_stop (write-byte -1 s) (write-byte 0 s))
     ;; float32 _set_Kp_PUN
       (sys::poke _set_Kp_PUN (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Ki_PUN
       (sys::poke _set_Ki_PUN (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Kd_PUN
       (sys::poke _set_Kd_PUN (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Kp_OMB
       (sys::poke _set_Kp_OMB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Ki_OMB
       (sys::poke _set_Ki_OMB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Kd_OMB
       (sys::poke _set_Kd_OMB (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Kp_GAR
       (sys::poke _set_Kp_GAR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Ki_GAR
       (sys::poke _set_Ki_GAR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _set_Kd_GAR
       (sys::poke _set_Kd_GAR (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _set_OMB
     (setq _set_OMB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_COT
     (setq _set_COT (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_PUN
     (setq _set_PUN (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _set_GAR
     (setq _set_GAR (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _reset
     (setq _reset (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _retry
     (setq _retry (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _emergency_stop
     (setq _emergency_stop (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _set_Kp_PUN
     (setq _set_Kp_PUN (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Ki_PUN
     (setq _set_Ki_PUN (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Kd_PUN
     (setq _set_Kd_PUN (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Kp_OMB
     (setq _set_Kp_OMB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Ki_OMB
     (setq _set_Ki_OMB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Kd_OMB
     (setq _set_Kd_OMB (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Kp_GAR
     (setq _set_Kp_GAR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Ki_GAR
     (setq _set_Ki_GAR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _set_Kd_GAR
     (setq _set_Kd_GAR (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get custom_msg::set_angles :md5sum-) "f893037d084fc53525471a607a7aa8b3")
(setf (get custom_msg::set_angles :datatype-) "custom_msg/set_angles")
(setf (get custom_msg::set_angles :definition-)
      "float32 set_OMB
float32 set_COT
float32 set_PUN
bool 	set_GAR

bool 	reset
bool 	retry
bool 	emergency_stop

float32 set_Kp_PUN
float32 set_Ki_PUN
float32 set_Kd_PUN

float32 set_Kp_OMB
float32 set_Ki_OMB
float32 set_Kd_OMB

float32 set_Kp_GAR
float32 set_Ki_GAR
float32 set_Kd_GAR

")



(provide :custom_msg/set_angles "f893037d084fc53525471a607a7aa8b3")


