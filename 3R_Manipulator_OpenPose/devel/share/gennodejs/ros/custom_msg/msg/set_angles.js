// Auto-generated. Do not edit!

// (in-package custom_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class set_angles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.set_OMB = null;
      this.set_COT = null;
      this.set_PUN = null;
      this.set_GAR = null;
      this.reset = null;
      this.retry = null;
      this.emergency_stop = null;
      this.set_Kp_PUN = null;
      this.set_Ki_PUN = null;
      this.set_Kd_PUN = null;
      this.set_Kp_OMB = null;
      this.set_Ki_OMB = null;
      this.set_Kd_OMB = null;
      this.set_Kp_GAR = null;
      this.set_Ki_GAR = null;
      this.set_Kd_GAR = null;
    }
    else {
      if (initObj.hasOwnProperty('set_OMB')) {
        this.set_OMB = initObj.set_OMB
      }
      else {
        this.set_OMB = 0.0;
      }
      if (initObj.hasOwnProperty('set_COT')) {
        this.set_COT = initObj.set_COT
      }
      else {
        this.set_COT = 0.0;
      }
      if (initObj.hasOwnProperty('set_PUN')) {
        this.set_PUN = initObj.set_PUN
      }
      else {
        this.set_PUN = 0.0;
      }
      if (initObj.hasOwnProperty('set_GAR')) {
        this.set_GAR = initObj.set_GAR
      }
      else {
        this.set_GAR = false;
      }
      if (initObj.hasOwnProperty('reset')) {
        this.reset = initObj.reset
      }
      else {
        this.reset = false;
      }
      if (initObj.hasOwnProperty('retry')) {
        this.retry = initObj.retry
      }
      else {
        this.retry = false;
      }
      if (initObj.hasOwnProperty('emergency_stop')) {
        this.emergency_stop = initObj.emergency_stop
      }
      else {
        this.emergency_stop = false;
      }
      if (initObj.hasOwnProperty('set_Kp_PUN')) {
        this.set_Kp_PUN = initObj.set_Kp_PUN
      }
      else {
        this.set_Kp_PUN = 0.0;
      }
      if (initObj.hasOwnProperty('set_Ki_PUN')) {
        this.set_Ki_PUN = initObj.set_Ki_PUN
      }
      else {
        this.set_Ki_PUN = 0.0;
      }
      if (initObj.hasOwnProperty('set_Kd_PUN')) {
        this.set_Kd_PUN = initObj.set_Kd_PUN
      }
      else {
        this.set_Kd_PUN = 0.0;
      }
      if (initObj.hasOwnProperty('set_Kp_OMB')) {
        this.set_Kp_OMB = initObj.set_Kp_OMB
      }
      else {
        this.set_Kp_OMB = 0.0;
      }
      if (initObj.hasOwnProperty('set_Ki_OMB')) {
        this.set_Ki_OMB = initObj.set_Ki_OMB
      }
      else {
        this.set_Ki_OMB = 0.0;
      }
      if (initObj.hasOwnProperty('set_Kd_OMB')) {
        this.set_Kd_OMB = initObj.set_Kd_OMB
      }
      else {
        this.set_Kd_OMB = 0.0;
      }
      if (initObj.hasOwnProperty('set_Kp_GAR')) {
        this.set_Kp_GAR = initObj.set_Kp_GAR
      }
      else {
        this.set_Kp_GAR = 0.0;
      }
      if (initObj.hasOwnProperty('set_Ki_GAR')) {
        this.set_Ki_GAR = initObj.set_Ki_GAR
      }
      else {
        this.set_Ki_GAR = 0.0;
      }
      if (initObj.hasOwnProperty('set_Kd_GAR')) {
        this.set_Kd_GAR = initObj.set_Kd_GAR
      }
      else {
        this.set_Kd_GAR = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type set_angles
    // Serialize message field [set_OMB]
    bufferOffset = _serializer.float32(obj.set_OMB, buffer, bufferOffset);
    // Serialize message field [set_COT]
    bufferOffset = _serializer.float32(obj.set_COT, buffer, bufferOffset);
    // Serialize message field [set_PUN]
    bufferOffset = _serializer.float32(obj.set_PUN, buffer, bufferOffset);
    // Serialize message field [set_GAR]
    bufferOffset = _serializer.bool(obj.set_GAR, buffer, bufferOffset);
    // Serialize message field [reset]
    bufferOffset = _serializer.bool(obj.reset, buffer, bufferOffset);
    // Serialize message field [retry]
    bufferOffset = _serializer.bool(obj.retry, buffer, bufferOffset);
    // Serialize message field [emergency_stop]
    bufferOffset = _serializer.bool(obj.emergency_stop, buffer, bufferOffset);
    // Serialize message field [set_Kp_PUN]
    bufferOffset = _serializer.float32(obj.set_Kp_PUN, buffer, bufferOffset);
    // Serialize message field [set_Ki_PUN]
    bufferOffset = _serializer.float32(obj.set_Ki_PUN, buffer, bufferOffset);
    // Serialize message field [set_Kd_PUN]
    bufferOffset = _serializer.float32(obj.set_Kd_PUN, buffer, bufferOffset);
    // Serialize message field [set_Kp_OMB]
    bufferOffset = _serializer.float32(obj.set_Kp_OMB, buffer, bufferOffset);
    // Serialize message field [set_Ki_OMB]
    bufferOffset = _serializer.float32(obj.set_Ki_OMB, buffer, bufferOffset);
    // Serialize message field [set_Kd_OMB]
    bufferOffset = _serializer.float32(obj.set_Kd_OMB, buffer, bufferOffset);
    // Serialize message field [set_Kp_GAR]
    bufferOffset = _serializer.float32(obj.set_Kp_GAR, buffer, bufferOffset);
    // Serialize message field [set_Ki_GAR]
    bufferOffset = _serializer.float32(obj.set_Ki_GAR, buffer, bufferOffset);
    // Serialize message field [set_Kd_GAR]
    bufferOffset = _serializer.float32(obj.set_Kd_GAR, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type set_angles
    let len;
    let data = new set_angles(null);
    // Deserialize message field [set_OMB]
    data.set_OMB = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_COT]
    data.set_COT = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_PUN]
    data.set_PUN = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_GAR]
    data.set_GAR = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [reset]
    data.reset = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [retry]
    data.retry = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [emergency_stop]
    data.emergency_stop = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [set_Kp_PUN]
    data.set_Kp_PUN = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Ki_PUN]
    data.set_Ki_PUN = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Kd_PUN]
    data.set_Kd_PUN = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Kp_OMB]
    data.set_Kp_OMB = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Ki_OMB]
    data.set_Ki_OMB = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Kd_OMB]
    data.set_Kd_OMB = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Kp_GAR]
    data.set_Kp_GAR = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Ki_GAR]
    data.set_Ki_GAR = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [set_Kd_GAR]
    data.set_Kd_GAR = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'custom_msg/set_angles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f893037d084fc53525471a607a7aa8b3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 set_OMB
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new set_angles(null);
    if (msg.set_OMB !== undefined) {
      resolved.set_OMB = msg.set_OMB;
    }
    else {
      resolved.set_OMB = 0.0
    }

    if (msg.set_COT !== undefined) {
      resolved.set_COT = msg.set_COT;
    }
    else {
      resolved.set_COT = 0.0
    }

    if (msg.set_PUN !== undefined) {
      resolved.set_PUN = msg.set_PUN;
    }
    else {
      resolved.set_PUN = 0.0
    }

    if (msg.set_GAR !== undefined) {
      resolved.set_GAR = msg.set_GAR;
    }
    else {
      resolved.set_GAR = false
    }

    if (msg.reset !== undefined) {
      resolved.reset = msg.reset;
    }
    else {
      resolved.reset = false
    }

    if (msg.retry !== undefined) {
      resolved.retry = msg.retry;
    }
    else {
      resolved.retry = false
    }

    if (msg.emergency_stop !== undefined) {
      resolved.emergency_stop = msg.emergency_stop;
    }
    else {
      resolved.emergency_stop = false
    }

    if (msg.set_Kp_PUN !== undefined) {
      resolved.set_Kp_PUN = msg.set_Kp_PUN;
    }
    else {
      resolved.set_Kp_PUN = 0.0
    }

    if (msg.set_Ki_PUN !== undefined) {
      resolved.set_Ki_PUN = msg.set_Ki_PUN;
    }
    else {
      resolved.set_Ki_PUN = 0.0
    }

    if (msg.set_Kd_PUN !== undefined) {
      resolved.set_Kd_PUN = msg.set_Kd_PUN;
    }
    else {
      resolved.set_Kd_PUN = 0.0
    }

    if (msg.set_Kp_OMB !== undefined) {
      resolved.set_Kp_OMB = msg.set_Kp_OMB;
    }
    else {
      resolved.set_Kp_OMB = 0.0
    }

    if (msg.set_Ki_OMB !== undefined) {
      resolved.set_Ki_OMB = msg.set_Ki_OMB;
    }
    else {
      resolved.set_Ki_OMB = 0.0
    }

    if (msg.set_Kd_OMB !== undefined) {
      resolved.set_Kd_OMB = msg.set_Kd_OMB;
    }
    else {
      resolved.set_Kd_OMB = 0.0
    }

    if (msg.set_Kp_GAR !== undefined) {
      resolved.set_Kp_GAR = msg.set_Kp_GAR;
    }
    else {
      resolved.set_Kp_GAR = 0.0
    }

    if (msg.set_Ki_GAR !== undefined) {
      resolved.set_Ki_GAR = msg.set_Ki_GAR;
    }
    else {
      resolved.set_Ki_GAR = 0.0
    }

    if (msg.set_Kd_GAR !== undefined) {
      resolved.set_Kd_GAR = msg.set_Kd_GAR;
    }
    else {
      resolved.set_Kd_GAR = 0.0
    }

    return resolved;
    }
};

module.exports = set_angles;
