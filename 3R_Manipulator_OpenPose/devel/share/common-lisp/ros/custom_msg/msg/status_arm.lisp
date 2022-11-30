; Auto-generated. Do not edit!


(cl:in-package custom_msg-msg)


;//! \htmlinclude status_arm.msg.html

(cl:defclass <status_arm> (roslisp-msg-protocol:ros-message)
  ((junta
    :reader junta
    :initarg :junta
    :type cl:string
    :initform "")
   (pulsos_setpoint
    :reader pulsos_setpoint
    :initarg :pulsos_setpoint
    :type cl:float
    :initform 0.0)
   (pulsos_contados
    :reader pulsos_contados
    :initarg :pulsos_contados
    :type cl:float
    :initform 0.0)
   (pulsos_erro
    :reader pulsos_erro
    :initarg :pulsos_erro
    :type cl:float
    :initform 0.0)
   (output_P
    :reader output_P
    :initarg :output_P
    :type cl:float
    :initform 0.0)
   (output_I
    :reader output_I
    :initarg :output_I
    :type cl:float
    :initform 0.0)
   (output_D
    :reader output_D
    :initarg :output_D
    :type cl:float
    :initform 0.0)
   (output_PID
    :reader output_PID
    :initarg :output_PID
    :type cl:float
    :initform 0.0)
   (loop_time
    :reader loop_time
    :initarg :loop_time
    :type cl:float
    :initform 0.0)
   (IsDone
    :reader IsDone
    :initarg :IsDone
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass status_arm (<status_arm>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <status_arm>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'status_arm)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msg-msg:<status_arm> is deprecated: use custom_msg-msg:status_arm instead.")))

(cl:ensure-generic-function 'junta-val :lambda-list '(m))
(cl:defmethod junta-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:junta-val is deprecated.  Use custom_msg-msg:junta instead.")
  (junta m))

(cl:ensure-generic-function 'pulsos_setpoint-val :lambda-list '(m))
(cl:defmethod pulsos_setpoint-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:pulsos_setpoint-val is deprecated.  Use custom_msg-msg:pulsos_setpoint instead.")
  (pulsos_setpoint m))

(cl:ensure-generic-function 'pulsos_contados-val :lambda-list '(m))
(cl:defmethod pulsos_contados-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:pulsos_contados-val is deprecated.  Use custom_msg-msg:pulsos_contados instead.")
  (pulsos_contados m))

(cl:ensure-generic-function 'pulsos_erro-val :lambda-list '(m))
(cl:defmethod pulsos_erro-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:pulsos_erro-val is deprecated.  Use custom_msg-msg:pulsos_erro instead.")
  (pulsos_erro m))

(cl:ensure-generic-function 'output_P-val :lambda-list '(m))
(cl:defmethod output_P-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:output_P-val is deprecated.  Use custom_msg-msg:output_P instead.")
  (output_P m))

(cl:ensure-generic-function 'output_I-val :lambda-list '(m))
(cl:defmethod output_I-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:output_I-val is deprecated.  Use custom_msg-msg:output_I instead.")
  (output_I m))

(cl:ensure-generic-function 'output_D-val :lambda-list '(m))
(cl:defmethod output_D-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:output_D-val is deprecated.  Use custom_msg-msg:output_D instead.")
  (output_D m))

(cl:ensure-generic-function 'output_PID-val :lambda-list '(m))
(cl:defmethod output_PID-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:output_PID-val is deprecated.  Use custom_msg-msg:output_PID instead.")
  (output_PID m))

(cl:ensure-generic-function 'loop_time-val :lambda-list '(m))
(cl:defmethod loop_time-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:loop_time-val is deprecated.  Use custom_msg-msg:loop_time instead.")
  (loop_time m))

(cl:ensure-generic-function 'IsDone-val :lambda-list '(m))
(cl:defmethod IsDone-val ((m <status_arm>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:IsDone-val is deprecated.  Use custom_msg-msg:IsDone instead.")
  (IsDone m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <status_arm>) ostream)
  "Serializes a message object of type '<status_arm>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'junta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'junta))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pulsos_setpoint))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pulsos_contados))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pulsos_erro))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'output_P))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'output_I))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'output_D))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'output_PID))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'loop_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'IsDone) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <status_arm>) istream)
  "Deserializes a message object of type '<status_arm>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'junta) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'junta) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pulsos_setpoint) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pulsos_contados) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pulsos_erro) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_P) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_I) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_D) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output_PID) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'loop_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:setf (cl:slot-value msg 'IsDone) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<status_arm>)))
  "Returns string type for a message object of type '<status_arm>"
  "custom_msg/status_arm")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'status_arm)))
  "Returns string type for a message object of type 'status_arm"
  "custom_msg/status_arm")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<status_arm>)))
  "Returns md5sum for a message object of type '<status_arm>"
  "c3c5e83e349a8305c77eff5da188ae4a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'status_arm)))
  "Returns md5sum for a message object of type 'status_arm"
  "c3c5e83e349a8305c77eff5da188ae4a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<status_arm>)))
  "Returns full string definition for message of type '<status_arm>"
  (cl:format cl:nil "string junta~%float32 pulsos_setpoint~%float32 pulsos_contados~%float32 pulsos_erro~%float32 output_P~%float32 output_I~%float32 output_D~%float32 output_PID~%float32 loop_time~%bool IsDone~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'status_arm)))
  "Returns full string definition for message of type 'status_arm"
  (cl:format cl:nil "string junta~%float32 pulsos_setpoint~%float32 pulsos_contados~%float32 pulsos_erro~%float32 output_P~%float32 output_I~%float32 output_D~%float32 output_PID~%float32 loop_time~%bool IsDone~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <status_arm>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'junta))
     4
     4
     4
     4
     4
     4
     4
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <status_arm>))
  "Converts a ROS message object to a list"
  (cl:list 'status_arm
    (cl:cons ':junta (junta msg))
    (cl:cons ':pulsos_setpoint (pulsos_setpoint msg))
    (cl:cons ':pulsos_contados (pulsos_contados msg))
    (cl:cons ':pulsos_erro (pulsos_erro msg))
    (cl:cons ':output_P (output_P msg))
    (cl:cons ':output_I (output_I msg))
    (cl:cons ':output_D (output_D msg))
    (cl:cons ':output_PID (output_PID msg))
    (cl:cons ':loop_time (loop_time msg))
    (cl:cons ':IsDone (IsDone msg))
))
