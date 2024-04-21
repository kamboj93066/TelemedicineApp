import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServoScreen extends StatefulWidget {
  const ServoScreen({Key? key}) : super(key: key);

  @override
  State<ServoScreen> createState() => _SensorScreenState();
}

class SensorData {
  final String sensorName;
  final String value;

  const SensorData(this.sensorName, this.value);
}

class _SensorScreenState extends State<ServoScreen> {
  SensorData? _selectedSensor;

  Future<void> fetchData(String sensorName) async {
    final url = Uri.parse('http://127.0.0.1:5001/turn_on_sensor/$sensorName');
    final response = await http.post(url);
    log(response.statusCode as String);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _selectedSensor = SensorData(data['sensor_name'], data['data']);
      });
    } else {
      // Handle errors by informing the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Error fetching data: ${response.statusCode}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ATAL- Servo Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => fetchData('Dwai0'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('GET\nNaxdom'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => fetchData('Dwai1'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('GET\nOmeraprazole'),
                ),
                ElevatedButton(
                  onPressed: () => fetchData('Dwai2'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('GET\n Paracetamol'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => fetchData('Dwai3'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('GET \n Ibrufen'),
                ),
              ],
            ),
            if (_selectedSensor != null)
              // Update the UI with the new sensor data
              Text(
                '${_selectedSensor!.sensorName}: ${_selectedSensor!.value}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
