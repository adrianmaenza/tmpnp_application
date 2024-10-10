import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage('https://via.placeholder.com/150'),
        ),
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Welcome', style: TextStyle(color: Colors.black, fontSize: 14)),
            Text('John Doe', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),


      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'What are you looking for...',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.grey.shade300
            ),
          ),
          const SizedBox(height: 16),

          // Location Selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('TM Pick n Pay Avondale'),
              TextButton(
                onPressed: () {},
                child: const Text('Change', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Promo Banner
          Container(
            height: 120,
            color: Colors.green, // You can use an image here instead
            child: const Center(child: Text('Promo Banner')),
          ),
          const SizedBox(height: 16),

          // Shop by Category
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Shop by Category', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Categories Row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItem('Perishables', Icons.local_dining),
                CategoryItem('Dry Foods', Icons.local_grocery_store),
                CategoryItem('Beverages', Icons.local_bar),
                CategoryItem('Fruit & Vegetables', Icons.local_florist),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Top Online Deals
          const Text('Top Online Deals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3/5,
            children: const [
              ProductCard(
                title: 'Coca-Cola Original Soft Drink 2L',
                price: '\$2.00',
                imageUrl: 'https://via.placeholder.com/100',
              ),
              ProductCard(
                title: 'Bakers Betta Snack Milk Chocolate 200g',
                price: '\$3.50',
                imageUrl: 'https://via.placeholder.com/100',
              ),
              // Add more ProductCard widgets if needed
            ],
          ),


          const SizedBox(height: 16),

          // Featured Products
          const Text('Featured Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3/5,
              children: const [
                ProductCard(
                  title: 'Coca-Cola Original Soft Drink 2L',
                  price: '\$2.00',
                  imageUrl: 'https://via.placeholder.com/100',
                ),
                ProductCard(
                  title: 'Bakers Betta Snack Milk Chocolate 200g',
                  price: '\$3.50',
                  imageUrl: 'https://via.placeholder.com/100',
                ),
                // Add more ProductCard widgets if needed
              ],
            ),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Specials'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Trolley'),
        ],
      ),
    );


  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;

  CategoryItem(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: Icon(icon),
          ),
          SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}
