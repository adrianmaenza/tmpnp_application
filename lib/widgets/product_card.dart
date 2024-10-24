import 'package:flutter/material.dart';
import 'package:tmpnp_application/screens/product/product_view.dart';
import 'package:tmpnp_application/util/constants.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final VoidCallback onSelect;
  final VoidCallback? onAdd;
  final VoidCallback? onLike;
  final bool isFavourite;

  const ProductCard(
      {
        super.key,
        required this.title,
        required this.price,
        required this.imageUrl,
        required this.onSelect,
        this.onAdd,
        this.onLike,
        required this.isFavourite
      });

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
                    onPressed: onLike,
                    icon: Icon(
                      isFavourite ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: isFavourite ? Colors.red : const Color(primaryColor),
                    )),
                const Spacer(),
                IconButton(
                    onPressed: onAdd,
                    icon: const Icon(
                      Icons.add_circle_outline,
                      size: 16,
                    ))
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: onSelect,
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
              onTap: onSelect,
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
