import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/login.provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Provider.of<LoginController>(context);

    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: loginCtrl.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock, size: 60, color: Colors.blueGrey),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: loginCtrl.usernameController,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) => value!.isEmpty ? "Masukkan username" : null,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: loginCtrl.passwordController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    validator: (value) => value!.isEmpty ? "Masukkan password" : null,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => loginCtrl.login(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[700],
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    ),
                    child: const Text("Login", style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
