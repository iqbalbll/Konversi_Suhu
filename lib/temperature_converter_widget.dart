import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/suhu.provider.dart';

class TemperatureConverter extends StatelessWidget {
  const TemperatureConverter({super.key});

  Widget _buildTemperatureInput(BuildContext context, String unit, IconData icon, Color color) {
    final controller = Provider.of<TemperatureController>(context);

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
              controller: controller.controllers[unit],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: unit,
                labelStyle: TextStyle(color: color, fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (value) => controller.convert(unit, value),
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
            _buildTemperatureInput(context, 'Celsius', Icons.thermostat, Colors.red),
            _buildTemperatureInput(context, 'Fahrenheit', Icons.thermostat_auto, Colors.blue),
            _buildTemperatureInput(context, 'Kelvin', Icons.device_thermostat, Colors.green),
            _buildTemperatureInput(context, 'Reamur', Icons.waves, Colors.orange),
          ],
        ),
      ),
    );
  }
}
