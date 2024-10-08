import 'package:flutter/material.dart';

import 'botom_navigator_bar.dart';
import 'forget_password.dart';
//import 'home_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //Background image
          Image.asset(
            'assets/r1.jpg', // Add your image in the assets folder and update this path
            fit: BoxFit.cover,
          ),
          // Transparent overlay for the content
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Login form content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo or icon at the top
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white.withOpacity(0.9),
                    child: const Icon(
                      Icons.eco,
                      size: 50,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // "Log in" Text
                  const Text(
                    "Log in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  
                  // Input fields for Email/Phone and Password
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      label: const Text("Enter your Email"),
                      hoverColor: const Color.fromARGB(255, 59, 16, 246),
                      hintText: 'Enter Number or Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      label: const Text("Enter Password"),
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  
                  // Log in button
                  ElevatedButton(
                    onPressed: () {
                      // Implement login functionality here
                      Navigator.of(context).push(
                          MaterialPageRoute(
                           builder: (context) => NavigatorPage(),
                         ),
                        );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15), backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ), // button color
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Forgot Password link
                  TextButton(
                    onPressed: () {
                      // Implement forgot password functionality here
                      Navigator.of(context).push(
                          MaterialPageRoute(
                           builder: (context) => ForgotPasswordScreen(),
                         ),
                        );
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}