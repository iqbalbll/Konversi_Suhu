import 'package:flutter/material.dart';
import '../temperature_converter_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*class LoginController extends ChangeNotifier {
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
}*/

class LoginController extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance; // Inisialisasi FirebaseAuth

  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String email = usernameController.text;
      String password = passwordController.text;

      try {
        // Login menggunakan Firebase Auth
        await _auth.signInWithEmailAndPassword(email: email, password: password);

        // Jika berhasil, navigasi ke halaman berikutnya
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const TemperatureConverter()),
        );
      } on FirebaseAuthException catch (e) {
        // Tangani error Firebase Auth
        String errorMessage;
        if (e.code == 'user-not-found') {
          errorMessage = "Pengguna tidak ditemukan!";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Password salah!";
        } else {
          errorMessage = "Terjadi kesalahan: ${e.message}";
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
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
