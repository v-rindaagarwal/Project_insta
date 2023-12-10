// register_screen.dart

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _register() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email == "" || password == "") {
      log("Please fill all the details");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        if (userCredential.user != null) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Registration successful!'),
            duration: Duration(seconds: 2), // Adjust the duration as needed
          ));
        }
      } on FirebaseAuthException catch (ex) {
        if (ex.code.toString() == 'email-already-in-use') {
          // Email is already registered, show a snackbar with the message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email registered, Try Logging in'),
              duration: Duration(seconds: 2), // Adjust the duration as needed
            ),
          );
        }
        log(ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _register,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
