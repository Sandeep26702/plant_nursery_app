import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<Item> items = [
  Item(name: 'Chery', price: 200, quantity: 1, image: 'assets/chery.jpeg'),
  Item(name: 'Marigold', price: 200, quantity: 1, image: 'assets/marigold.webp'),
  Item(name: 'Sunflower', price: 200, quantity: 1, image: 'assets/sunflower.jpg'),
  Item(name: 'Dhatura', price: 200, quantity: 1, image: 'assets/dhatura.jpg'),
];

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price * current.quantity);

  void incrementQuantity(int index) {
    setState(() {
      items[index].quantity++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (items[index].quantity > 1) items[index].quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.asset(items[index].image),
                    title: Text(items[index].name),
                    subtitle: Text('\$${items[index].price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => decrementQuantity(index),
                        ),
                        Text('${items[index].quantity}'),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => incrementQuantity(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Handle checkout logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent, // Checkout button color
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Check Out'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  String name;
  int price;
  int quantity;
  String image;

  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.image,
  });
}