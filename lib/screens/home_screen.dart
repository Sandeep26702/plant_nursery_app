//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'manu_navigator.dart';
//import 'package:plant_nusery_app/screens/categories.dart';

class PlantHomePage extends StatefulWidget {
  const PlantHomePage({super.key});

  @override
  State<PlantHomePage> createState() => _PlantHomePageState();
}

class _PlantHomePageState extends State<PlantHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home', style: TextStyle(color: Colors.green)),
        centerTitle: true,

     leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.green),  // This is the menu icon
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SidebarMenu()),
          );
          // Add functionality for the menu icon here
        },
      ),

      actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {},
          ),
          ],
        backgroundColor: Colors.green[50],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  plantItem('Rose', 'assets/rose.jpg'),
                  plantItem('Lily', 'assets/lily.jpeg'),
                  plantItem('Money Plant', 'assets/lotos.jpeg'),
                  plantItem('Sandalwood', 'assets/rose.jpg'),
                  plantItem('Dalchini', 'assets/lily.jpeg'),
                  plantItem('Cucumber', 'assets/lotos.jpeg'),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget plantItem(String name, String imagePath) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}