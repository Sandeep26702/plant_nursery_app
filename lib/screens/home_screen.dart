

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
//import 'package:plant_nusery_app/screens/categories.dart';

class PlantHomePage extends StatefulWidget {
  const PlantHomePage({super.key});

  @override
  State<PlantHomePage> createState() => _PlantHomePageState();
}

class _PlantHomePageState extends State<PlantHomePage> {
 
  @override
  Widget build(BuildContext context) {
    var name = [
      'Chery',
      'Dhatura',
      'Marigold',
      'Sunflower',
      'Lutos',
      'Lily',
      
    ]; 
    var imgpath = [
  'assets/chery.jpeg',
  'assets/dhatura.jpg',
  'assets/marigold.webp',
  'assets/sunflower.jpg',
  'assets/lotos.jpeg',
  'assets/lily.jpeg',
];
    // var imgmaterials = [
    //   plantItem('Rose', 'images/rose.jpg'),
    //               plantItem('Lily', 'images/lily.jpg'),
    //               plantItem('Money Plant', 'images/money_plant.jpg'),
    //               plantItem('Sandalwood', 'images/sandal.jpeg'),
    //               plantItem('Dalchini', 'images/dalchini.jpeg'),
    //               plantItem('Cucumber', 'images/cucumber.jpg'),
    // ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home', style: TextStyle(color: Colors.green)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {
              Navigator.of(context).push(
                          MaterialPageRoute(
                           builder: (context) => const ShoppingCart(),
                         ),
                        );
            },
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
              child:GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ), 
              itemBuilder: (context, index) => plantItem(name[index] ,imgpath[index] ),
              itemCount: name.length,
              )
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
