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
