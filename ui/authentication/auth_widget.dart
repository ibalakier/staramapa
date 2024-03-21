import 'package:flutter/material.dart';
import 'package:staramapa/ui/authentication/login_widget.dart';
import 'package:staramapa/ui/authentication/signup_widget.dart';

class SignupLoginScreen extends StatelessWidget {
  const SignupLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stara Mapa'),
          backgroundColor: Colors.amber[500],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Logowanie'),
              Tab(text: 'Rejestracja'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginCard(),
            SignupCard(),
          ],
        ),
      ),
    );
  }
}
