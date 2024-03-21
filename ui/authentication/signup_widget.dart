
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:staramapa/common/utils/toast_utils.dart';
import 'package:staramapa/ui/home/home_widget.dart';

class SignupCard extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  SignupCard({super.key});

  void _register(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
    _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) {
      ToastUtils.showToast("Utworzono nowego użytkownika");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    }).catchError((error) {
      ToastUtils.showToast("Rejestracja nie powiodła się");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Center(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.map_outlined,
                  color: Colors.amber,
                  size: 80.0,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              margin: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Hasło'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _register(context);
                      },
                      child: const Text('Zarejestruj się'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}