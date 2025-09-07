// Yeh code lib/main.dart file mein paste karein
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase ko jodne ke liye

// Yeh function app ko shuru karta hai
Future<void> main() async {
  // Yeh lines Firebase ko shuru karne ke liye zaroori hain
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  
  runApp(const MyApp());
}

// Yeh aapki poori app ka base hai
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beta Panel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthScreen(), // App shuru hone par AuthScreen dikhegi
    );
  }
}

// Yeh screen Login aur Signup ka kaam karegi
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true; 

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isLogin ? 'Welcome Back!' : 'Create Account',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              const SizedBox(height: 40),
              if (!_isLogin)
                TextFormField(decoration: const InputDecoration(labelText: 'Full Name')),
              if (!_isLogin) const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Email ID')),
              const SizedBox(height: 16),
              TextFormField(decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () { /* TODO: Login/Signup logic here */ },
                child: Text(_isLogin ? 'LOGIN' : 'REGISTER'),
              ),
              TextButton(
                onPressed: _toggleForm,
                child: Text(_isLogin ? 'Don\'t have an account? Sign Up' : 'Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
