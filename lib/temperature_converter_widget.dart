import 'package:flutter/material.dart';
import 'temperature_converter_logic.dart';

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  final Map<String, TextEditingController> _controllers = {
    'Celsius': TextEditingController(),
    'Fahrenheit': TextEditingController(),
    'Kelvin': TextEditingController(),
    'Reamur': TextEditingController(),
  };

  final List<String> _units = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur'];

  void _convert(String fromUnit, String value) {
    if (value.isEmpty) return;

    double inputValue = double.tryParse(value) ?? 0.0;

    setState(() {
      for (var unit in _units) {
        if (unit == fromUnit) continue; // Skip unit yang sama
        double result = convertTemperature(inputValue, fromUnit, unit);
        _controllers[unit]!.text = result.toStringAsFixed(2);
      }
    });
  }

  Widget _buildTemperatureInput(String unit, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 10),
            TextField(
              controller: _controllers[unit],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: unit,
                labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) => _convert(unit, value),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: const Text('Konversi Suhu'),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildTemperatureInput('Celsius', Icons.thermostat, Colors.red),
            _buildTemperatureInput('Fahrenheit', Icons.thermostat_auto, Colors.blue),
            _buildTemperatureInput('Kelvin', Icons.device_thermostat, Colors.green),
            _buildTemperatureInput('Reamur', Icons.waves, Colors.orange),
          ],
        ),
      ),
    );
  }
}
