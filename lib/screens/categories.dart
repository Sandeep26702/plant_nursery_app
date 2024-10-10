
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:plant_nusery_app/screens/categories.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories', style: TextStyle(color: Colors.green)),
        centerTitle: true,
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
                crossAxisCount: 2 ,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,
                children: [
                  plantItem('TREES', 'assets/tree.jpg'),
                   plantItem('FRUIT', 'assets/fruit.jpg'),
                  plantItem('AQUATIC', 'assets/aquatic.jpg'),
                  plantItem('Vegitables', 'assets/vegitable.jpg'),
                  plantItem('Ground Covers', 'assets/grass.jpg'),
                   plantItem('Annuals', 'assets/rose.jpg'),
                  plantItem('GARDENING', 'assets/miniplant.jpeg'),
                  plantItem('SEEDS', 'assets/seeds.jpg'),
                  plantItem('POTS', 'assets/pot.jpeg'),
                  plantItem('FERTILIZERS', 'assets/fzr.jpeg'),
                   


                     
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