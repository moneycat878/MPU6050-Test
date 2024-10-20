%VCC to 5V
%GND to GND
%SCL to A4
%SDA to A5

clear;
clc;
close all;

% Connect to Arduino
a = arduino('COM3', 'uno', 'Libraries', 'I2C'); 

clear imu;
%0x68 is the I2C address of the accelerometer and gyroscope of MPU-6050 connected to Arduino board.
%imu is the sensor object.
imu = mpu6050(a, 'I2CAddress', '0x68');

%Set desired sampling duration in seconds
sampling_duration = 60 * 5; % Total time in seconds to track sensor data upon starting program. Default = 5 mins.
num_samples = sampling_duration;


%initialize data logging arrays
num_samples = sampling_duration;
accelData = zeros(num_samples, 3); %num of samples, 3 axes
gyroData = zeros(num_samples, 3); %num of samples, 3 axes

for i = 1:num_samples
    %Read acceleration
    %Returns one sample of the acceleration data on x, y, and z axes read from the sensor in units of m/s^2.
    accelReadings = readAcceleration(imu);
    %log accel data
    accelData(i,:) = accelReadings;

    %Read angular velocity
    gyroReadings = readAngularVelocity(imu);
    %log gyro data
    gyroData(i,:) = gyroReadings;

    %Delay determines frequency of data logging
    pause(1); %1 of a second
end

%Create header row
%header = {"Time (s)", 'Accel_X', 'Accel_Y', 'Accel_Z', 'Gyro_X', 'Gyro_Y', 'Gyro_Z'};
% Create header row as a character array
% = cell2mat(arrayfun(@(x) [x, ' '], header, 'UniformOutput', false));

%Log data to CSV file
filename = 'sensor_data.csv';
data = [linspace(0, sampling_duration, num_samples)', accelData, gyroData];

%csvwrite(filename, header, 0, 0);
csvwrite(filename, data, 1, 0);

%Visualize data
figure;
subplot(2, 1, 1);
plot(accelData);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
legend('X', 'Y', 'Z');
title('Acceleration Data');

subplot(2, 1, 2);
plot(gyroData);
xlabel('Time (s)');
ylabel('Angular Velocity (rad/s)');
legend('X', 'Y', 'Z');
title('Gyroscope Data');