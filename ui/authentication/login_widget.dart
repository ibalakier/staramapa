import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:staramapa/common/utils/toast_utils.dart';
import 'package:staramapa/ui/home/home_widget.dart';


class LoginCard extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginCard({super.key});

  void _logIn(BuildContext context) {
    String email = _emailController.text;
    String password = _passwordController.text;
    _auth.signInWithEmailAndPassword(email: email, password: password)
        .then((_) {
      ToastUtils.showToast("Zalogowano użytkownika");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  const MainScreen()),
      );
    }).catchError((error) {
      ToastUtils.showToast("Taki użytkownik nie istnieje");
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
                      _logIn(context);
                    },
                    child: const Text('Zaloguj się'),
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