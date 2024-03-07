# Development Module for Safety Radar Sensor in Single-Track Vehicles

<!-- ### Features on PCB
* ESP32
    * BLE
    * MAC
    * 2 UARTs (flashing/debugging + radar interface)
    * $I^2C$ or SPI
* CP2102 USB-UART module
* PHY Ethernet module with connector
* IMU (6+3 DoF)
* Power management
* LED neopixel
* Buzzer
* Pogo pins – board to board connector
* ESP32 GPIO <-> radar pins (FFC conn)
* 100BASE-T1 connector
* ANT+ module -->

The RSS project includes two software repositories:

* ROS2 package as emulation of radar procesing unit and RSS demo module [(RSS_ROS2)](https://gitext.alps.cz/240703/rss_ros2)
* ESP-IDF project for ESP32 implementing uROS and all hardware peripherals [(RSS_uROS)](https://gitext.alps.cz/240703/rss_uros)

### [Schematic design](documents/RSS_schematic_v1.0.0.pdf)

### [Thesis](documents/Tavoda_semestral_thesis.pdf)

### [Photo documentation](documents/photos/)

### Block diagram

![](documents/BlockDiagram-Main.svg)

### Power management diagram

![](documents/BlockDiagram-PowerManagement.svg)

### ROS2 graph

![](documents/ROS2graph-RSS_graph.svg)
