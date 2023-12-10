import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70), // Adjust the app bar height
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
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
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8), // Light shade
            ),
          ),
          Align(
            alignment: Alignment.topCenter, // Align the text to the top
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),

                SizedBox(height: 20),
                Spacer(), // Add a spacer to push the buttons to the bottom
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the login screen
                    Navigator.of(context).pushNamed('/login');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 29, 90, 40),
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
                    child: Center(
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
                SizedBox(height: 20), // Add some spacing
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the registration screen
                    Navigator.of(context).pushNamed('/register');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 29, 90, 40),
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
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'YourFont',
                          fontSize: 20, // Change the font
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100),
                // Add an image here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
