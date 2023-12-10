import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up/screens/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({Key? key}) : super(key: key);

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  TextEditingController phoneController = TextEditingController();

  void sendOTP() async {
    String phone = "+91" + phoneController.text.trim();

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (verificationId, resendToken) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => VerifyOtpScreen(
                        verificationId: verificationId,
                      )));
        },
        verificationCompleted: (credential) {},
        verificationFailed: (ex) {
          log(ex.code.toString());
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: const Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign In with Phone"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 29, 90, 40),
                Color.fromARGB(255, 0, 8, 1),
              ], // Gradient background
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ), // Change app bar color to green
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  sendOTP();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 29, 90, 40),
                  ), // Hex color
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Reduce border radius
                    ),
                  ),
                ),
                child: Container(
                  width: 300,
                  height: 50, // Broader button
                  child: const Center(
                    child: Text(
                      'Sign',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'YourFont',
                        fontSize: 20, // Change the font
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
