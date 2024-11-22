import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'botom_navigator_bar.dart';
import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Function to handle login
  Future<void> _login() async {
    try {
      // Attempt to log in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If login is successful, navigate to the next screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavigatorPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors here (e.g., wrong credentials)
      String errorMessage = 'An error occurred. Please try again.';

      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
      }

      // Show error message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      label: const Text("Enter your Email"),
                      hintText: 'Enter Number or Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextField(
                    controller: _passwordController,
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
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
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
                      // Navigate to the Forgot Password screen
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
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
