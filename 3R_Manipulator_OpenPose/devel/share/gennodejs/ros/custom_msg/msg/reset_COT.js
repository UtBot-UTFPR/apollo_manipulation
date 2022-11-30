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

class reset_COT {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reset_COT = null;
    }
    else {
      if (initObj.hasOwnProperty('reset_COT')) {
        this.reset_COT = initObj.reset_COT
      }
      else {
        this.reset_COT = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reset_COT
    // Serialize message field [reset_COT]
    bufferOffset = _serializer.bool(obj.reset_COT, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reset_COT
    let len;
    let data = new reset_COT(null);
    // Deserialize message field [reset_COT]
    data.reset_COT = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'custom_msg/reset_COT';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8be9f92adaf46f35e0791e11db65f1f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool reset_COT
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reset_COT(null);
    if (msg.reset_COT !== undefined) {
      resolved.reset_COT = msg.reset_COT;
    }
    else {
      resolved.reset_COT = false
    }

    return resolved;
    }
};

module.exports = reset_COT;
