import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_world_app/kernel/widgets/text_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('logo.png', width: 150, height: 150),
                    // const SizedBox(height: 32),
                    // const Text(
                    //   "Iniciar sesión",
                    //   style: TextStyle(
                    //     fontSize: 28,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    const SizedBox(height: 32),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        hintText: "tu@correo.com",
                        label: Text("Correo electrónico"),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                    ),
                    const SizedBox(height: 32.0),
                    TextFieldPassword(controller: _pass),
                    const SizedBox(height: 32.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => _login(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("Iniciar sesión"),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: InkWell(
                          onTap: () =>
                              Navigator.pushNamed(context, '/register'),
                          child: const Text(
                            "Registrarse",
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.deepPurpleAccent,
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email.text, password: _pass.text);

      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}