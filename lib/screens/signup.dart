import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';  // Assuming you have a login screen to navigate to after successful signup

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  // final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String? _selectedGender = 'Male';

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up with email and password
  Future<void> _signUp() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      // Show an error if passwords do not match
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    try {
      // Create a new user with email and password using FirebaseAuth
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Create user document in Firestore
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'first_name': _firstNameController.text.trim(),
        'last_name': _lastNameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'user_id': userCredential.user?.uid,
        'gender': _selectedGender,
        'created_at': FieldValue.serverTimestamp(),
      });

      // Print user info (optional)
      print('User signed up and data saved to Firestore: ${userCredential.user?.email}');

      // After successful sign-up, navigate to the Login screen
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } on FirebaseAuthException catch (e) {
      // Handle errors here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Error occurred")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/r4.jpg', // Add your image in the assets folder and update this path
            fit: BoxFit.cover,
          ),
          // Transparent overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Sign up form content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // "Sign up" Text
                    const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    
                    // Input fields for First name, Last name, Email, Mobile number
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'First name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'Last name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'Mobile number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                
                    // TextField(
                    //   controller: _userIdController,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     fillColor: Colors.white.withOpacity(0.9),
                    //     hintText: 'User Id',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 20),
                
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.9),
                        hintText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                
                    // Gender selection radio buttons
                    Row(
                      children: [
                        const Text(
                          'Gender: ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Row(
                            children: [
                              Radio<String>(
                                value: 'Male',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                                activeColor: Colors.white,
                              ),
                              const Text(
                                'Male',
                                style: TextStyle(color: Colors.white),
                              ),
                              Radio<String>(
                                value: 'Female',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                                activeColor: Colors.white,
                              ),
                              const Text(
                                'Female',
                                style: TextStyle(color: Colors.white),
                              ),
                              Radio<String>(
                                value: 'Other',
                                groupValue: _selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedGender = value;
                                  });
                                },
                                activeColor: Colors.white,
                              ),
                              const Text(
                                'Other',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    
                    // "Next" button
                    ElevatedButton(
                      onPressed: _signUp,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15), 
                        backgroundColor: Colors.white.withOpacity(0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ), // button color
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
