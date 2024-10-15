import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/product/product_view.dart';
import 'package:tmpnp_application/util/constants.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 16,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () => {},
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 16,
                    ))
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ProductView();
                  }));
                },
                child: SizedBox(
                    height: 100,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            const SizedBox(height: 16),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductView()),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // Aligns text to the left
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      color: Color(primaryColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
