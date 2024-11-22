import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_sign_up.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String firstName = '';
  late String lastName = '';
  late String userEmail = '';
  late String userPhone = '';
  late String userGender = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // Fetch user data from Firestore
  Future<void> fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      try {
        // Fetch user data from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();

        if (userDoc.exists) {
          setState(() {
            firstName = userDoc['first_name'] ?? 'Name not available';
            lastName = userDoc['last_name'] ?? 'Name not available';
            userEmail = userDoc['email'] ?? 'Email not available';
            userPhone = userDoc['phone'] ?? 'Phone not available';
            userGender = userDoc['gender'] ?? 'Gender not available';
            isLoading = false;
          });
        } else {
          print('User document does not exist.');
        }
      } catch (e) {
        print("Error fetching user data: $e");
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile', style: TextStyle(color: Colors.green)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.green),
            onPressed: () {
              // Handle profile edit
            },
          ),
        ],
        backgroundColor: Colors.green[50],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.person_add, size: 40, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  profileItem(Icons.person, 'Name', "$firstName $lastName"),
                  const SizedBox(height: 15),
                  profileItem(Icons.email, 'E-Mail', userEmail),
                  const SizedBox(height: 15),
                  profileItem(Icons.phone, 'Phone no.', userPhone),
                  const SizedBox(height: 15),
                  profileItem(Icons.person_outline, 'Gender', userGender, iconColor: Colors.purple),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const LoginSignUp()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.green[100], // text color
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Logout', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
    );
  }

  Widget profileItem(IconData icon, String title, String subtitle, {Color? iconColor}) {
    return Row(
      children: [
        Icon(icon, color: iconColor ?? Colors.black),
        const SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(subtitle, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
