MPU6050 Test

This project is designed to collect accelerometer and gyroscope data using an Arduino and MPU6050 sensor. The collected data is then analyzed and visualized in MATLAB.

Usage
Hardware Setup:

Connect your Arduino and MPU6050 sensor according to the provided pin layout:
VCC to 5V
GND to GND
SCL to A4
SDA to A5

Ensure the Arduino's serial port is correctly configured in MATLAB.
Run the MATLAB Script:

Open the MATLAB script in your IDE.

Modify the sampling_duration variable (located in the script) to set the desired data collection time in seconds. The default value is 5 minutes (300 seconds).

Run the script. The program will collect data for the specified duration and then terminate.

Key Parameters
sampling_duration: Sets the duration (in seconds) for which data will be collected. The default value is 300 seconds (5 minutes).

Data Output
The collected data is saved as a CSV file named "sensor_data.csv". The file contains columns for time, acceleration (X, Y, Z), and angular velocity (X, Y, Z).

Visualizations
The script generates plots of the collected acceleration and gyroscope data, providing a visual representation of the sensor readings over time.

Note: For more detailed information on the project's implementation and analysis, refer to MATLAB's mpu6050 documentation:
https://www.mathworks.com/help/matlab/supportpkg/arduinoio.mpu6050-system-object.html
