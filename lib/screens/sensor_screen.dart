// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SensorScreen extends StatefulWidget {
//   const SensorScreen({Key? key}) : super(key: key);

//   @override
//   State<SensorScreen> createState() => _SensorScreenState();
// }

// class _SensorScreenState extends State<SensorScreen> {
//   String temperature = "";
//   String pulse = "";

//   Future<void> fetchData(String sensorName) async {
//     final url = Uri.parse('http://127.0.0.1:5001/turn_on_sensor/$sensorName');
//     final response = await http.post(url);

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         if (data['sensor_name'] == 'temperature') {
//           temperature = data['data'];
//         } else if (data['sensor_name'] == 'pulse') {
//           pulse = data['data'];
//         }
//       });
//     } else {
//       // Handle errors by informing the user
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.red,
//           content: Text('Error fetching data: ${response.statusCode}'),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ATAL'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => fetchData('temperature'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(200, 100),
//                     textStyle: TextStyle(fontSize: 20),
//                   ),
//                   child: Text('CHECK\nTEMPERATURE'),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () => fetchData('pulse'),
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(200, 100),
//                     textStyle: TextStyle(fontSize: 20),
//                   ),
//                   child: Text('CHECK\nPULSE'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Temperature: $temperature',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Pulse: $pulse',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SensorScreen extends StatefulWidget {
  const SensorScreen({Key? key}) : super(key: key);

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class SensorData {
  final String sensorName;
  final String value;

  const SensorData(this.sensorName, this.value);
}

class _SensorScreenState extends State<SensorScreen> {
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
        title: Text('ATAL'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => fetchData('temperature'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('CHECK\nTEMPERATURE'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => fetchData('pulse'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('CHECK\nPULSE'),
                ),
                ElevatedButton(
                  onPressed: () => fetchData('voc'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('CHECK\nVOC'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => fetchData('finger'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 100),
                    textStyle: TextStyle(fontSize: 20),
                  ),
                  child: Text('Use\nFingerprint'),
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
