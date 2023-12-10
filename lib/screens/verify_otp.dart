import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verificationId;
  const VerifyOtpScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController otpController = TextEditingController();

  void verifyOTP() async {
    String otp = otpController.text.trim();

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otp);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        Navigator.popUntil(context, (route) => route.isFirst);
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (context) => HomePage()));
      }
    } on FirebaseAuthException catch (ex) {
      log(ex.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify OTP"),
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
        ), //
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: otpController,
                    maxLength: 6,
                    decoration: InputDecoration(
                        labelText: "6-Digit OTP", counterText: ""),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      verifyOTP();
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
                          'Verify',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'YourFont',
                            fontSize: 20, // Change the font
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
