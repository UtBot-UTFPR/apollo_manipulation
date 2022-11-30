; Auto-generated. Do not edit!


(cl:in-package custom_msg-msg)


;//! \htmlinclude reset_COT.msg.html

(cl:defclass <reset_COT> (roslisp-msg-protocol:ros-message)
  ((reset_COT
    :reader reset_COT
    :initarg :reset_COT
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass reset_COT (<reset_COT>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset_COT>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset_COT)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name custom_msg-msg:<reset_COT> is deprecated: use custom_msg-msg:reset_COT instead.")))

(cl:ensure-generic-function 'reset_COT-val :lambda-list '(m))
(cl:defmethod reset_COT-val ((m <reset_COT>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader custom_msg-msg:reset_COT-val is deprecated.  Use custom_msg-msg:reset_COT instead.")
  (reset_COT m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset_COT>) ostream)
  "Serializes a message object of type '<reset_COT>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset_COT) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset_COT>) istream)
  "Deserializes a message object of type '<reset_COT>"
    (cl:setf (cl:slot-value msg 'reset_COT) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset_COT>)))
  "Returns string type for a message object of type '<reset_COT>"
  "custom_msg/reset_COT")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_COT)))
  "Returns string type for a message object of type 'reset_COT"
  "custom_msg/reset_COT")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset_COT>)))
  "Returns md5sum for a message object of type '<reset_COT>"
  "8be9f92adaf46f35e0791e11db65f1f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset_COT)))
  "Returns md5sum for a message object of type 'reset_COT"
  "8be9f92adaf46f35e0791e11db65f1f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset_COT>)))
  "Returns full string definition for message of type '<reset_COT>"
  (cl:format cl:nil "bool reset_COT~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset_COT)))
  "Returns full string definition for message of type 'reset_COT"
  (cl:format cl:nil "bool reset_COT~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset_COT>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset_COT>))
  "Converts a ROS message object to a list"
  (cl:list 'reset_COT
    (cl:cons ':reset_COT (reset_COT msg))
))
