; Auto-generated. Do not edit!


(cl:in-package custom_msg-msg)


;//! \htmlinclude set_angles.msg.html

(cl:defclass <set_angles> (roslisp-msg-protocol:ros-message)
  ((set_OMB
    :reader set_OMB
    :initarg :set_OMB
    :type cl:float
    :initform 0.0)
   (set_COT
    :reader set_COT
    :initarg :set_COT
    :type cl:float
    :initform 0.0)
   (set_PUN
    :reader set_PUN
    :initarg :set_PUN
    :type cl:float
    :initform 0.0)
   (set_GAR
    :reader set_GAR
    :initarg :set_GAR
    :type cl:boolean
    :initform cl:nil)
   (reset
    :reader reset
    :initarg :reset
    :type cl:boolean
    :initform cl:nil)
   (retry
    :reader retry
    :initarg :retry
    :type cl:boolean
    :initform cl:nil)
   (emergency_stop
    :reader emergency_stop
    :initarg :emergency_stop
    :type cl:boolean
    :initform cl:nil)
   (set_Kp_PUN
    :reader set_Kp_PUN
    :initarg :set_Kp_PUN
    :type cl:float
    :initform 0.0)
   (set_Ki_PUN
    :reader set_Ki_PUN
    :initarg :set_Ki_PUN
    :type cl:float
    :initform 0.0)
   (set_Kd_PUN
    :reader set_Kd_PUN
    :initarg :set_Kd_PUN
    :type cl:float
    :initform 0.0)
   (set_Kp_OMB
    :reader set_Kp_OMB
    :initarg :set_Kp_OMB
    :type cl:float
    :initform 0.0)
   (set_Ki_OMB
    :reader set_Ki_OMB
    :initarg :set_Ki_OMB
    :type cl:float
    :initform 0.0)
   (set_Kd_OMB
    :reader set_Kd_OMB
    :initarg :set_Kd_OMB
    :type cl:float
    :initform 0.0)
   (set_Kp_GAR
    :reader set_Kp_GAR
    :initarg :set_Kp_GAR
    :type cl:float
    :initform 0.0)
   (set_Ki_GAR
    :reader set_Ki_GAR
    :initarg :set_Ki_GAR
    :type cl:float
    :initform 0.0)
   (set_Kd_GAR
    :reader set_Kd_GAR
    :initarg :set_Kd_GAR
    :type cl:float
    :initform 0.0))
)

(cl:defclass set_angles (<set_angles>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_angles>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_angles)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msg-msg:<set_angles> is deprecated: use custom_msg-msg:set_angles instead.")))

(cl:ensure-generic-function 'set_OMB-val :lambda-list '(m))
(cl:defmethod set_OMB-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_OMB-val is deprecated.  Use custom_msg-msg:set_OMB instead.")
  (set_OMB m))

(cl:ensure-generic-function 'set_COT-val :lambda-list '(m))
(cl:defmethod set_COT-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_COT-val is deprecated.  Use custom_msg-msg:set_COT instead.")
  (set_COT m))

(cl:ensure-generic-function 'set_PUN-val :lambda-list '(m))
(cl:defmethod set_PUN-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_PUN-val is deprecated.  Use custom_msg-msg:set_PUN instead.")
  (set_PUN m))

(cl:ensure-generic-function 'set_GAR-val :lambda-list '(m))
(cl:defmethod set_GAR-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_GAR-val is deprecated.  Use custom_msg-msg:set_GAR instead.")
  (set_GAR m))

(cl:ensure-generic-function 'reset-val :lambda-list '(m))
(cl:defmethod reset-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:reset-val is deprecated.  Use custom_msg-msg:reset instead.")
  (reset m))

(cl:ensure-generic-function 'retry-val :lambda-list '(m))
(cl:defmethod retry-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:retry-val is deprecated.  Use custom_msg-msg:retry instead.")
  (retry m))

(cl:ensure-generic-function 'emergency_stop-val :lambda-list '(m))
(cl:defmethod emergency_stop-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:emergency_stop-val is deprecated.  Use custom_msg-msg:emergency_stop instead.")
  (emergency_stop m))

(cl:ensure-generic-function 'set_Kp_PUN-val :lambda-list '(m))
(cl:defmethod set_Kp_PUN-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kp_PUN-val is deprecated.  Use custom_msg-msg:set_Kp_PUN instead.")
  (set_Kp_PUN m))

(cl:ensure-generic-function 'set_Ki_PUN-val :lambda-list '(m))
(cl:defmethod set_Ki_PUN-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Ki_PUN-val is deprecated.  Use custom_msg-msg:set_Ki_PUN instead.")
  (set_Ki_PUN m))

(cl:ensure-generic-function 'set_Kd_PUN-val :lambda-list '(m))
(cl:defmethod set_Kd_PUN-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kd_PUN-val is deprecated.  Use custom_msg-msg:set_Kd_PUN instead.")
  (set_Kd_PUN m))

(cl:ensure-generic-function 'set_Kp_OMB-val :lambda-list '(m))
(cl:defmethod set_Kp_OMB-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kp_OMB-val is deprecated.  Use custom_msg-msg:set_Kp_OMB instead.")
  (set_Kp_OMB m))

(cl:ensure-generic-function 'set_Ki_OMB-val :lambda-list '(m))
(cl:defmethod set_Ki_OMB-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Ki_OMB-val is deprecated.  Use custom_msg-msg:set_Ki_OMB instead.")
  (set_Ki_OMB m))

(cl:ensure-generic-function 'set_Kd_OMB-val :lambda-list '(m))
(cl:defmethod set_Kd_OMB-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kd_OMB-val is deprecated.  Use custom_msg-msg:set_Kd_OMB instead.")
  (set_Kd_OMB m))

(cl:ensure-generic-function 'set_Kp_GAR-val :lambda-list '(m))
(cl:defmethod set_Kp_GAR-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kp_GAR-val is deprecated.  Use custom_msg-msg:set_Kp_GAR instead.")
  (set_Kp_GAR m))

(cl:ensure-generic-function 'set_Ki_GAR-val :lambda-list '(m))
(cl:defmethod set_Ki_GAR-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Ki_GAR-val is deprecated.  Use custom_msg-msg:set_Ki_GAR instead.")
  (set_Ki_GAR m))

(cl:ensure-generic-function 'set_Kd_GAR-val :lambda-list '(m))
(cl:defmethod set_Kd_GAR-val ((m <set_angles>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:set_Kd_GAR-val is deprecated.  Use custom_msg-msg:set_Kd_GAR instead.")
  (set_Kd_GAR m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_angles>) ostream)
  "Serializes a message object of type '<set_angles>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_OMB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_COT))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_PUN))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'set_GAR) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'retry) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'emergency_stop) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kp_PUN))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Ki_PUN))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kd_PUN))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kp_OMB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Ki_OMB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kd_OMB))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kp_GAR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Ki_GAR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'set_Kd_GAR))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_angles>) istream)
  "Deserializes a message object of type '<set_angles>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_OMB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_COT) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_PUN) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'set_GAR) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'reset) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'retry) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'emergency_stop) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kp_PUN) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Ki_PUN) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kd_PUN) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kp_OMB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Ki_OMB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kd_OMB) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kp_GAR) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Ki_GAR) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'set_Kd_GAR) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_angles>)))
  "Returns string type for a message object of type '<set_angles>"
  "custom_msg/set_angles")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_angles)))
  "Returns string type for a message object of type 'set_angles"
  "custom_msg/set_angles")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_angles>)))
  "Returns md5sum for a message object of type '<set_angles>"
  "f893037d084fc53525471a607a7aa8b3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_angles)))
  "Returns md5sum for a message object of type 'set_angles"
  "f893037d084fc53525471a607a7aa8b3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_angles>)))
  "Returns full string definition for message of type '<set_angles>"
  (cl:format cl:nil "float32 set_OMB~%float32 set_COT~%float32 set_PUN~%bool 	set_GAR~%~%bool 	reset~%bool 	retry~%bool 	emergency_stop~%~%float32 set_Kp_PUN~%float32 set_Ki_PUN~%float32 set_Kd_PUN~%~%float32 set_Kp_OMB~%float32 set_Ki_OMB~%float32 set_Kd_OMB~%~%float32 set_Kp_GAR~%float32 set_Ki_GAR~%float32 set_Kd_GAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_angles)))
  "Returns full string definition for message of type 'set_angles"
  (cl:format cl:nil "float32 set_OMB~%float32 set_COT~%float32 set_PUN~%bool 	set_GAR~%~%bool 	reset~%bool 	retry~%bool 	emergency_stop~%~%float32 set_Kp_PUN~%float32 set_Ki_PUN~%float32 set_Kd_PUN~%~%float32 set_Kp_OMB~%float32 set_Ki_OMB~%float32 set_Kd_OMB~%~%float32 set_Kp_GAR~%float32 set_Ki_GAR~%float32 set_Kd_GAR~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_angles>))
  (cl:+ 0
     4
     4
     4
     1
     1
     1
     1
     4
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_angles>))
  "Converts a ROS message object to a list"
  (cl:list 'set_angles
    (cl:cons ':set_OMB (set_OMB msg))
    (cl:cons ':set_COT (set_COT msg))
    (cl:cons ':set_PUN (set_PUN msg))
    (cl:cons ':set_GAR (set_GAR msg))
    (cl:cons ':reset (reset msg))
    (cl:cons ':retry (retry msg))
    (cl:cons ':emergency_stop (emergency_stop msg))
    (cl:cons ':set_Kp_PUN (set_Kp_PUN msg))
    (cl:cons ':set_Ki_PUN (set_Ki_PUN msg))
    (cl:cons ':set_Kd_PUN (set_Kd_PUN msg))
    (cl:cons ':set_Kp_OMB (set_Kp_OMB msg))
    (cl:cons ':set_Ki_OMB (set_Ki_OMB msg))
    (cl:cons ':set_Kd_OMB (set_Kd_OMB msg))
    (cl:cons ':set_Kp_GAR (set_Kp_GAR msg))
    (cl:cons ':set_Ki_GAR (set_Ki_GAR msg))
    (cl:cons ':set_Kd_GAR (set_Kd_GAR msg))
))
