import 'package:flutter/material.dart';
import '../temperature_converter_widget.dart';

class LoginController extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      String username = usernameController.text;
      String password = passwordController.text;

      if (username == "Konversi_suhu" && password == "suhu") {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TemperatureConverter()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username atau Password salah!")),
        );
      }
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
