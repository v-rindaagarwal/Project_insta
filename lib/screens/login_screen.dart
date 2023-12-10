import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:start_up/screens/home_page.dart';
import 'package:start_up/screens/signinwithotp.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _selectedCategory = 'User'; // Default category is 'User'

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    if (email == '' || password == '') {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please fill all the details.'),
        duration: Duration(seconds: 2),
      ));
    } else {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        if (userCredential.user != null) {
          // Navigate to the Dashboard screen after a successful login
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomePage(), // Replace 'Dashboard' with your Dashboard screen
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Login successful!'),
            duration: Duration(seconds: 2),
          ));
        }
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'invalid-credentials') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Wrong Email or password!'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  void _navigateToSignUpWithPhone() {
    // Navigate to the Sign Up with Phone screen
    Navigator.pushNamed(context, '/signup_phone');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
        ),
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Add borderRadius
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(15), // Add borderRadius
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _login,
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
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'YourFont',
                          fontSize: 20, // Change the font
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup_phone');
                  },
                  child: const Text('Sign Up with Phone',
                      style: TextStyle(color: Color.fromARGB(255, 29, 90, 40))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
