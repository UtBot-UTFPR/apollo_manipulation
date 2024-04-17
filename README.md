# utbots_manipulation

**This stack contains packages related to manipulators, such as:**
- 3R_Manipulator_Firmware
- Heracles_Firmware
- manipulator_controller_cpp


## Getting started

### Installation

```bash
cd catkin_ws/src
git clone https://github.com/UtBot-UTFPR/custom_msg
git clone --recurse-submodules https://github.com/UtBotsAtHome-UTFPR/utbots_manipulation.git
```

### Building

```bash
cd ..
catkin_make
```

### Running

See the usage explanation accessing each package in the repository or the overview below

## Overview

### manipulator_controller_cpp

#### ROS nodes:
- **xz_controller_node**
- Receives: Point() - goal point
- Publishes: set_angles() - arm angles that reach the input point (in plane XZ)
- **xy_controller_node**
- Receives: Point() - goal point
- Publishes: Twist() - velocity command that makes robot turn (in plane XY)
- **setpoint_publisher_node**
- Publishes: Point() - can define a new point by pressing space

#### Arm joints

```yaml
OMB: ombro
COT: cotovelo
PUN: punho
GAR: garra
```

#### Parameters (config/parameters.yaml)

- Set arm lengths
- Set angular corrections
- Set acceptable yaw error (for XY twist)
- Set Kp constant used in PID (for XY twist)
- Set whether or not display debug info
        ```
#### Launch files
```bash
roslaunch manipulator_controller_cpp setpoint_xy.launch # only xy
roslaunch manipulator_controller_cpp setpoint_xz.launch # only xz
roslaunch manipulator_controller_cpp setpoint_xyz.launch # combines xy and xz
```

---

### 3R_Manipulator_Firmware

- **Pre-requisite: download and install [Arduino IDE](https://www.arduino.cc/en/software)**

- **Pre-requisite: custom headers compilation**
  
Since we have ROS custom messages defining new types of ROS messages, we need to compile them specifically for the Arduinos
```bash
# Compile catkin_ws
cd ~/catkin_ws
catkin_make
# Install rosserial_arduino
sudo apt install ros-noetic-rosserial-arduino
# Create libraries folder
mkdir -p ~/Arduino/libraries
cd ~/Arduino/libraries
# Run make_libraries in the current folder
# Make sure you have sourced ~/catkin_ws/devel/setup.bash
rosrun rosserial_arduino make_libraries.py .
  ```
  
**Compilation (with Arduino IDE)**
- Open Arduino IDE
- ``File`` > ``Open...`` > ``???/utbots_manipulation/3R_Manipulator_Firmware/Point/???/file.ino``
- Select board (Mega 2560)
- Click Verify to check code problems
- Plug Arduino to PC and upload the firmware to it

---

#### Using rosserial_python to interface ROS and Arduino

1. **Find out the name of the port used by the Arduino in the PC**
2. Connect board to PC via USB
3. Go to ``/dev/serial/by-id`` and find out the ID of your device
  - This file is actually a symlink to the **PORT NAME**
  - If you run ``ls -la /dev/serial/by-id/YOUR_ID``, you will find out that it points to a file called ``/dev/SOMETHING``. This is the **PORT NAME**
  - **PORT NAME** may vary if you plug multiple devices or reset the PC
  - **PORT ID** is static
  - Therefore, you should use **PORT ID** whenever you can

Run rosserial_python
```bash
# Install rosserial_python
sudo apt install ros-noetic-rosserial-python
rosrun rosserial_python serial_node.py _port:=/dev/PORT_NAME_OR_ID _baud:=57600
```

**WARNING**
Serial communication is exclusive. **This means you won't be able to simultaneously run rosserial, upload new firmware or monitor serial**

---

### Heracles_Firmware
