import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class about_us extends StatelessWidget {
  const about_us({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/logo.png'), // Replace with your own image
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Our Plant Nursery',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Our Plant Nursery! We are passionate about growing and nurturing a wide variety of plants, '
                'including trees, shrubs, flowers, and vegetables. Our mission is to provide healthy, high-quality plants '
                'to gardeners, landscapers, and plant lovers alike.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              const Text(
                'What We Offer:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• A wide range of plants, including indoor and outdoor varieties.\n'
                '• Expert advice on plant care and landscaping.\n'
                '• Sustainable and eco-friendly growing practices.\n'
                '• Workshops and community engagement events.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Email: info@plantnursery.com\n'
                'Phone: +123 456 7890\n'
                'Address: 123 Green Lane, Plant City, Country',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.facebook),
                      onPressed: () {
                        // Handle Facebook link
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.abc_sharp),
                      onPressed: () {
                        // Handle Instagram link
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.web),
                      onPressed: () {
                        // Handle Website link
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
