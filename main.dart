import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:staramapa/ui/app_widget.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).whenComplete(() {
    runApp(const AppWidget());
  });
}