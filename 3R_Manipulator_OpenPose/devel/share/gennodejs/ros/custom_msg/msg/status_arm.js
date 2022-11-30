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

class status_arm {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.junta = null;
      this.pulsos_setpoint = null;
      this.pulsos_contados = null;
      this.pulsos_erro = null;
      this.output_P = null;
      this.output_I = null;
      this.output_D = null;
      this.output_PID = null;
      this.loop_time = null;
      this.IsDone = null;
    }
    else {
      if (initObj.hasOwnProperty('junta')) {
        this.junta = initObj.junta
      }
      else {
        this.junta = '';
      }
      if (initObj.hasOwnProperty('pulsos_setpoint')) {
        this.pulsos_setpoint = initObj.pulsos_setpoint
      }
      else {
        this.pulsos_setpoint = 0.0;
      }
      if (initObj.hasOwnProperty('pulsos_contados')) {
        this.pulsos_contados = initObj.pulsos_contados
      }
      else {
        this.pulsos_contados = 0.0;
      }
      if (initObj.hasOwnProperty('pulsos_erro')) {
        this.pulsos_erro = initObj.pulsos_erro
      }
      else {
        this.pulsos_erro = 0.0;
      }
      if (initObj.hasOwnProperty('output_P')) {
        this.output_P = initObj.output_P
      }
      else {
        this.output_P = 0.0;
      }
      if (initObj.hasOwnProperty('output_I')) {
        this.output_I = initObj.output_I
      }
      else {
        this.output_I = 0.0;
      }
      if (initObj.hasOwnProperty('output_D')) {
        this.output_D = initObj.output_D
      }
      else {
        this.output_D = 0.0;
      }
      if (initObj.hasOwnProperty('output_PID')) {
        this.output_PID = initObj.output_PID
      }
      else {
        this.output_PID = 0.0;
      }
      if (initObj.hasOwnProperty('loop_time')) {
        this.loop_time = initObj.loop_time
      }
      else {
        this.loop_time = 0.0;
      }
      if (initObj.hasOwnProperty('IsDone')) {
        this.IsDone = initObj.IsDone
      }
      else {
        this.IsDone = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type status_arm
    // Serialize message field [junta]
    bufferOffset = _serializer.string(obj.junta, buffer, bufferOffset);
    // Serialize message field [pulsos_setpoint]
    bufferOffset = _serializer.float32(obj.pulsos_setpoint, buffer, bufferOffset);
    // Serialize message field [pulsos_contados]
    bufferOffset = _serializer.float32(obj.pulsos_contados, buffer, bufferOffset);
    // Serialize message field [pulsos_erro]
    bufferOffset = _serializer.float32(obj.pulsos_erro, buffer, bufferOffset);
    // Serialize message field [output_P]
    bufferOffset = _serializer.float32(obj.output_P, buffer, bufferOffset);
    // Serialize message field [output_I]
    bufferOffset = _serializer.float32(obj.output_I, buffer, bufferOffset);
    // Serialize message field [output_D]
    bufferOffset = _serializer.float32(obj.output_D, buffer, bufferOffset);
    // Serialize message field [output_PID]
    bufferOffset = _serializer.float32(obj.output_PID, buffer, bufferOffset);
    // Serialize message field [loop_time]
    bufferOffset = _serializer.float32(obj.loop_time, buffer, bufferOffset);
    // Serialize message field [IsDone]
    bufferOffset = _serializer.bool(obj.IsDone, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type status_arm
    let len;
    let data = new status_arm(null);
    // Deserialize message field [junta]
    data.junta = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [pulsos_setpoint]
    data.pulsos_setpoint = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pulsos_contados]
    data.pulsos_contados = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pulsos_erro]
    data.pulsos_erro = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [output_P]
    data.output_P = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [output_I]
    data.output_I = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [output_D]
    data.output_D = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [output_PID]
    data.output_PID = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [loop_time]
    data.loop_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [IsDone]
    data.IsDone = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.junta.length;
    return length + 37;
  }

  static datatype() {
    // Returns string type for a message object
    return 'custom_msg/status_arm';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c3c5e83e349a8305c77eff5da188ae4a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string junta
    float32 pulsos_setpoint
    float32 pulsos_contados
    float32 pulsos_erro
    float32 output_P
    float32 output_I
    float32 output_D
    float32 output_PID
    float32 loop_time
    bool IsDone
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new status_arm(null);
    if (msg.junta !== undefined) {
      resolved.junta = msg.junta;
    }
    else {
      resolved.junta = ''
    }

    if (msg.pulsos_setpoint !== undefined) {
      resolved.pulsos_setpoint = msg.pulsos_setpoint;
    }
    else {
      resolved.pulsos_setpoint = 0.0
    }

    if (msg.pulsos_contados !== undefined) {
      resolved.pulsos_contados = msg.pulsos_contados;
    }
    else {
      resolved.pulsos_contados = 0.0
    }

    if (msg.pulsos_erro !== undefined) {
      resolved.pulsos_erro = msg.pulsos_erro;
    }
    else {
      resolved.pulsos_erro = 0.0
    }

    if (msg.output_P !== undefined) {
      resolved.output_P = msg.output_P;
    }
    else {
      resolved.output_P = 0.0
    }

    if (msg.output_I !== undefined) {
      resolved.output_I = msg.output_I;
    }
    else {
      resolved.output_I = 0.0
    }

    if (msg.output_D !== undefined) {
      resolved.output_D = msg.output_D;
    }
    else {
      resolved.output_D = 0.0
    }

    if (msg.output_PID !== undefined) {
      resolved.output_PID = msg.output_PID;
    }
    else {
      resolved.output_PID = 0.0
    }

    if (msg.loop_time !== undefined) {
      resolved.loop_time = msg.loop_time;
    }
    else {
      resolved.loop_time = 0.0
    }

    if (msg.IsDone !== undefined) {
      resolved.IsDone = msg.IsDone;
    }
    else {
      resolved.IsDone = false
    }

    return resolved;
    }
};

module.exports = status_arm;
