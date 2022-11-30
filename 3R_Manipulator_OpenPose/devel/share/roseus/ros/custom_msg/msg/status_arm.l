;; Auto-generated. Do not edit!


(when (boundp 'custom_msg::status_arm)
  (if (not (find-package "CUSTOM_MSG"))
    (make-package "CUSTOM_MSG"))
  (shadow 'status_arm (find-package "CUSTOM_MSG")))
(unless (find-package "CUSTOM_MSG::STATUS_ARM")
  (make-package "CUSTOM_MSG::STATUS_ARM"))

(in-package "ROS")
;;//! \htmlinclude status_arm.msg.html


(defclass custom_msg::status_arm
  :super ros::object
  :slots (_junta _pulsos_setpoint _pulsos_contados _pulsos_erro _output_P _output_I _output_D _output_PID _loop_time _IsDone ))

(defmethod custom_msg::status_arm
  (:init
   (&key
    ((:junta __junta) "")
    ((:pulsos_setpoint __pulsos_setpoint) 0.0)
    ((:pulsos_contados __pulsos_contados) 0.0)
    ((:pulsos_erro __pulsos_erro) 0.0)
    ((:output_P __output_P) 0.0)
    ((:output_I __output_I) 0.0)
    ((:output_D __output_D) 0.0)
    ((:output_PID __output_PID) 0.0)
    ((:loop_time __loop_time) 0.0)
    ((:IsDone __IsDone) nil)
    )
   (send-super :init)
   (setq _junta (string __junta))
   (setq _pulsos_setpoint (float __pulsos_setpoint))
   (setq _pulsos_contados (float __pulsos_contados))
   (setq _pulsos_erro (float __pulsos_erro))
   (setq _output_P (float __output_P))
   (setq _output_I (float __output_I))
   (setq _output_D (float __output_D))
   (setq _output_PID (float __output_PID))
   (setq _loop_time (float __loop_time))
   (setq _IsDone __IsDone)
   self)
  (:junta
   (&optional __junta)
   (if __junta (setq _junta __junta)) _junta)
  (:pulsos_setpoint
   (&optional __pulsos_setpoint)
   (if __pulsos_setpoint (setq _pulsos_setpoint __pulsos_setpoint)) _pulsos_setpoint)
  (:pulsos_contados
   (&optional __pulsos_contados)
   (if __pulsos_contados (setq _pulsos_contados __pulsos_contados)) _pulsos_contados)
  (:pulsos_erro
   (&optional __pulsos_erro)
   (if __pulsos_erro (setq _pulsos_erro __pulsos_erro)) _pulsos_erro)
  (:output_P
   (&optional __output_P)
   (if __output_P (setq _output_P __output_P)) _output_P)
  (:output_I
   (&optional __output_I)
   (if __output_I (setq _output_I __output_I)) _output_I)
  (:output_D
   (&optional __output_D)
   (if __output_D (setq _output_D __output_D)) _output_D)
  (:output_PID
   (&optional __output_PID)
   (if __output_PID (setq _output_PID __output_PID)) _output_PID)
  (:loop_time
   (&optional __loop_time)
   (if __loop_time (setq _loop_time __loop_time)) _loop_time)
  (:IsDone
   (&optional __IsDone)
   (if __IsDone (setq _IsDone __IsDone)) _IsDone)
  (:serialization-length
   ()
   (+
    ;; string _junta
    4 (length _junta)
    ;; float32 _pulsos_setpoint
    4
    ;; float32 _pulsos_contados
    4
    ;; float32 _pulsos_erro
    4
    ;; float32 _output_P
    4
    ;; float32 _output_I
    4
    ;; float32 _output_D
    4
    ;; float32 _output_PID
    4
    ;; float32 _loop_time
    4
    ;; bool _IsDone
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _junta
       (write-long (length _junta) s) (princ _junta s)
     ;; float32 _pulsos_setpoint
       (sys::poke _pulsos_setpoint (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pulsos_contados
       (sys::poke _pulsos_contados (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pulsos_erro
       (sys::poke _pulsos_erro (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _output_P
       (sys::poke _output_P (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _output_I
       (sys::poke _output_I (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _output_D
       (sys::poke _output_D (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _output_PID
       (sys::poke _output_PID (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _loop_time
       (sys::poke _loop_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _IsDone
       (if _IsDone (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _junta
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _junta (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _pulsos_setpoint
     (setq _pulsos_setpoint (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pulsos_contados
     (setq _pulsos_contados (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pulsos_erro
     (setq _pulsos_erro (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _output_P
     (setq _output_P (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _output_I
     (setq _output_I (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _output_D
     (setq _output_D (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _output_PID
     (setq _output_PID (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _loop_time
     (setq _loop_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _IsDone
     (setq _IsDone (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get custom_msg::status_arm :md5sum-) "c3c5e83e349a8305c77eff5da188ae4a")
(setf (get custom_msg::status_arm :datatype-) "custom_msg/status_arm")
(setf (get custom_msg::status_arm :definition-)
      "string junta
float32 pulsos_setpoint
float32 pulsos_contados
float32 pulsos_erro
float32 output_P
float32 output_I
float32 output_D
float32 output_PID
float32 loop_time
bool IsDone
")



(provide :custom_msg/status_arm "c3c5e83e349a8305c77eff5da188ae4a")


