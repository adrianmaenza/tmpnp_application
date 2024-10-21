import 'package:flutter/material.dart';
import 'package:tmpnp_application/models/product.dart';
import 'package:tmpnp_application/screens/category/category_view.dart';
import 'package:tmpnp_application/util/constants.dart';

import '../services/product_service.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ProductService productService = ProductService();

  List<Product> featured = [];

  @override
  @override
  void initState() {
    super.initState();
    _loadFeatured();
  }

  Future<void> _loadFeatured() async {
    try {
      final data = await productService.fetchFeatured();
      setState(() {
        featured = data;
      });
    } catch (e) {
      // Handle error gracefully
      print('Error fetching regions: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://placehold.co/100x100/png'),
          ),
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
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(color: Colors.black)
              ],
              borderRadius: BorderRadius.circular(5)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TM Pick n Pay Avondale'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Change', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Promo Banner
          SizedBox(
            height: 300,

            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 300,
                    child: Image.asset('assets/pnp-one.png')
                ),
                const SizedBox(width: 10,),
                SizedBox(
                    width: 300,
                    child: Image.asset('assets/pnp-2.png')
                )
              ],
            ),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem('Perishables', Icons.local_dining),
              CategoryItem('Dry Foods', Icons.local_grocery_store),
              CategoryItem('Beverages', Icons.local_bar),
              CategoryItem('Fruit & Veg', Icons.local_florist),
            ],
          ),
          const SizedBox(height: 16),

          // Top Online Deals
          const Text('Top Online Deals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),

          SizedBox(
            height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: featured.length,
              itemBuilder: (context, index) {
                final product = featured[index];
                return SizedBox(
                  width: 180,
                  child: ProductCard(
                    title: product.name,
                    price: '\$${product.price}',
                    imageUrl: '$bucketUrl/product_images/${product.image}',
                  ),
                );
              },
            ),
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
                  imageUrl: 'https://placehold.co/600x400/png',
                ),
                ProductCard(
                  title: 'Bakers Betta Snack Milk Chocolate 200g',
                  price: '\$3.50',
                  imageUrl: 'https://placehold.co/600x400/png',
                ),
                // Add more ProductCard widgets if needed
              ],
            ),
        ],
      ),


      bottomNavigationBar: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: const Icon(Icons.home), onPressed: () => {},),
              IconButton(icon: const Icon(Icons.add_business_outlined), onPressed: () => {},),
              IconButton(icon: const Icon(Icons.local_offer), onPressed: () => {},),
              IconButton(icon: const Icon(Icons.favorite), onPressed: () => {},),
              IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () => {},),
            ],
          ),
        ),
      )
    );


  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;

  const CategoryItem(this.name, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            child: IconButton(
              icon: Icon(icon),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoryView()
                    )
                )
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(name),
        ],
      ),
    );
  }
}
