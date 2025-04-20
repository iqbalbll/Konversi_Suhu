import 'package:flutter/material.dart';

class TemperatureController extends ChangeNotifier {
  final Map<String, TextEditingController> controllers = {
    'Celsius': TextEditingController(),
    'Fahrenheit': TextEditingController(),
    'Kelvin': TextEditingController(),
    'Reamur': TextEditingController(),
  };

  final List<String> units = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reamur'];

  double convertTemperature(double value, String fromUnit, String toUnit) {
    double celsius;

    // Konversi ke Celsius
    if (fromUnit == 'Celsius') {
      celsius = value;
    } else if (fromUnit == 'Fahrenheit') {
      celsius = (value - 32) * 5 / 9;
    } else if (fromUnit == 'Kelvin') {
      celsius = value - 273.15;
    } else {
      celsius = value * 5 / 4;
    }

    // Konversi dari Celsius ke satuan yang dipilih
    if (toUnit == 'Celsius') {
      return celsius;
    } else if (toUnit == 'Fahrenheit') {
      return (celsius * 9 / 5) + 32;
    } else if (toUnit == 'Kelvin') {
      return celsius + 273.15;
    } else {
      return celsius * 4 / 5;
    }
  }

  void convert(String fromUnit, String value) {
    if (value.isEmpty) return;

    double inputValue = double.tryParse(value) ?? 0.0;

    for (var unit in units) {
      if (unit == fromUnit) continue;

      double result = convertTemperature(inputValue, fromUnit, unit);
      controllers[unit]!.text = result.toStringAsFixed(2);
    }

    notifyListeners();
  }

  @override
  void dispose() {
    for (var controller in controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
