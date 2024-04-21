from flask import Flask, request, jsonify
import serial

# Replace with your Arduino serial port
arduino_port = '/dev/cu.usbmodem11201'

# Configure serial communication
arduino = serial.Serial(arduino_port, 9600)

app = Flask(__name__)

@app.route('/turn_on_sensor/<sensor_name>', methods=['POST'])
def turn_on_sensor(sensor_name):
  # Validate sensor name
  if sensor_name not in ['LED']:  # Replace with your valid sensor names
    return jsonify({'error': 'Invalid sensor name'}), 400

  # Send command to Arduino
  command = 'B'  # Command to blink the LED (as per your Arduino code)
  arduino.write(command.encode())

  # Read response from Arduino (optional)
  # You can uncomment these lines if your Arduino sends data back
  # response = arduino.readline().decode().strip()
  # return jsonify({'sensor_name': sensor_name, 'data': response})

  # No response expected in this case, so return empty data
  return jsonify({'sensor_name': sensor_name, 'data': "None"})

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5001)
