import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medmate/Pages/home.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:medmate/Pages/signup.dart';
import 'package:medmate/Pages/login.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medmate',
      theme: ThemeData(
          useMaterial3: true, textTheme: GoogleFonts.outfitTextTheme()),
      home: Signup(),
    );
  }
}
