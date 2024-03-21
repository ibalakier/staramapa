import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:staramapa/ui/authentication/auth_widget.dart';
import 'package:staramapa/ui/authentication/login_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupLoginScreen()),
                );
              } catch (e) {
                print('Wystąpił błąd podczas wylogowywania: $e');
              }
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Witaj!'),
      ),
    );
  }
}