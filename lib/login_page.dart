import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/login.provider.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCtrl = Provider.of<LoginController>(context);
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    
    String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email tidak boleh kosong';
  }
  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
    return 'Format email tidak valid';
  }
  return null;
}

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

/*return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child:SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                blurRadius: 23,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(13, 49, 27, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Login Title
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontFamily: 'Sakkal Majalla',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),

              // Terms and Privacy Policy Text
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Sakkal Majalla',
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'By signing in you are agreeing our ',
                        style: TextStyle(
                          color: Color.fromRGBO(107, 94, 94, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Term and privacy polic',
                        style: TextStyle(
                          color: Color.fromRGBO(3, 134, 208, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'y',
                        style: TextStyle(
                          color: Color.fromRGBO(3, 134, 208, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Email Field
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 47, left: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/mail.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TextFormField(
                        controller: _emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validateEmail,
                        decoration: const InputDecoration(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(166, 166, 166, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Sakkal Majalla',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Password Field
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 48, left: 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/lock.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Color.fromRGBO(166, 166, 166, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        style: const TextStyle(
                          fontSize: 25,
                          fontFamily: 'Sakkal Majalla',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Remember Password and Forget Password
              Container(
                margin: const EdgeInsets.only(top: 39),
                width: 321,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Remember Password Checkbox
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _rememberPassword = !_rememberPassword;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: const Color.fromRGBO(212, 197, 197, 1),
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(2),
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color.fromRGBO(250, 250, 250, 1),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: _rememberPassword
                                  ? const Icon(
                                      Icons.check,
                                      size: 16,
                                      color: Color.fromRGBO(3, 134, 208, 1),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Text(
                          'Remember password',
                          style: TextStyle(
                            color: Color.fromRGBO(107, 94, 94, 1),
                            fontSize: 21,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    // Forget Password Link
                    const Text(
                      'Forget password',
                      style: TextStyle(
                        color: Color.fromRGBO(3, 134, 208, 1),
                        fontSize: 21,
                        fontFamily: 'Sakkal Majalla',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              

              // Login Button
              Container(
                margin: const EdgeInsets.only(top: 37),
                width: 326,
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  /*onPressed: () => login(_emailController.text.toString(),
                  _passwordController.text.toString()),*/
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(3, 134, 208, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 4,
                    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'Sakkal Majalla',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                
              ),
            const SizedBox(
              height: 20,
            ),
            /*
            Text(notif,
              textAlign: TextAlign.center,
              style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              ),
            ),
            */
              // Or Connect With Section
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/img3.png',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        const Text(
                          'or connect with',
                          style: TextStyle(
                            color: Color.fromRGBO(116, 112, 112, 1),
                            fontSize: 25,
                            fontFamily: 'Sakkal Majalla',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(229),
                          child: Image.asset(
                            'assets/images/gg.png',
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ),
      ),
    );*/

  }
}
