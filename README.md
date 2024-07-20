# Learland: Smart Greenhouse Management System

Learland is a smart greenhouse management system that allows you to monitor and maintain your greenhouse remotely. It tracks various environmental parameters such as air humidity, soil moisture, air and soil temperature, light intensity, and CO2 levels, ensuring optimal conditions for plant growth.

## Features

- **Real-time Sensor Monitoring**: Collects and presents data from sensors in real-time, with alerts for deviations.
- **Remote Control**: Manual control of irrigation, ventilation, heating, lighting, and door access.
- **Greenhouse Sector Division**: Manage different sectors of the greenhouse with specific programs.
- **Automatic Mode**: Smart maintenance and periodic operations to keep parameters within set limits.
- **Advisor**: Educates users on plant requirements, providing data on ideal conditions for different plants.

## How It Works

### Application

- **Mobile Application**
  - Framework: Flutter
  - Programming Language: Dart
  - Database: Firebase
- **Windows Application**
  - Framework: .NET
  - Programming Language: C#
  - Database: Firebase

### Data Collection

- **Electronics**
  - Based on Node MCU (microcontroller with integrated Wi-Fi).
  - Node MCU reads sensor data and sends it to Firebase.
  - Smart maintenance checks data locally and executes programs if conditions are met.

### Greenhouse Control

- **Manual Mode**
  - User activates a mode, and Node MCU runs the corresponding program.
  - Controls irrigation, ventilation, heating, and lighting systems as needed.

## Screenshots

![Real-time Sensor Data](./Mobile%20Application/web/real-time-sensor-data.png) &emsp;&emsp;&emsp; ![Manual Control](./Mobile%20Application/web/manual-control.png) &emsp;&emsp;&emsp; ![Sector Management](./Mobile%20Application/web/sector-management.png) &emsp;&emsp;&emsp; ![Automatic Mode Settings](./Mobile%20Application/web/automatic-mode-settings.png)
&emsp;
![Advisor Feature](./Mobile%20Application/web/advisor-feature.png)
