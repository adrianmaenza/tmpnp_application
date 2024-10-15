import 'package:flutter/material.dart';
import 'package:tmpnp_application/util/constants.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: const Color(0xFFFAFAFA),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [

              Center(
                child: SizedBox(height: 250, child: Image.network('https://placehold.co/600x400/png', fit: BoxFit.contain,)),
              ),

              const SizedBox(height: 10),

              // Product name
              const Text(
                "Coca-Cola Original Soft Drink 2L",
                style: TextStyle(
                    color: Color(secondaryColor),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              // Add some space
              const SizedBox(height: 20),

              // Product price
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Product price
                  const Text(
                    "\$2.00",
                    style: TextStyle(
                        color: Color(primaryColor),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  // Quantity controls
                  Row(
                    children: [
                      // reduce quantity
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.remove_circle_outline),
                        color: const Color(primaryColor),
                      ),

                      // quantity
                      const Text("1"),

                      // Increase quantity
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add_circle_outline),
                        color: const Color(primaryColor),
                      ),
                    ],
                  ),
                ],
              ),

              const Row(
                children: [
                  Icon(
                    Icons.text_snippet_outlined,
                    size: 18,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    "Return policy",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),

              // Add some space
              const SizedBox(
                height: 50,
              ),

              // Product information
              const Text(
                "Product information",
                style: TextStyle(
                    color: Color(secondaryColor),
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(
                height: 5,
              ),

              // Product description
              const Text(
                  "Coca-Cola Original taste is the world's favourite soft drink and has..."),
            ],
          ),
        ),

        // Bottom navigation bar
        bottomNavigationBar: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined)),

                // add some space
                const SizedBox(width: 20),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(primaryColor),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("\$2.00", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),

                // add some space
                const SizedBox(width: 20),

                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
              ],
            ),
          ),
        ));
  }
}
