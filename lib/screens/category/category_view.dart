import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/bloc/app/app_bloc.dart';
import 'package:tmpnp_application/services/product_service.dart';

import '../../models/product.dart';
import '../../util/constants.dart';
import '../../widgets/product_card.dart';
import '../product/product_view.dart';

class CategoryView extends StatefulWidget {
  final String name;
  final String path;

  const CategoryView(this.name, this.path, {super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final ProductService productService = ProductService();

  List<Product> products = [];
  bool loading = true;

  Future<void> _getProducts() async {
    try {
      final data = await productService.fetchAisle(widget.path);

      setState(() {
        products = data;
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text(widget.name),
      ),

      // body
      body: BlocProvider(
        create: (context) => AppBloc(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: loading
              ? const LinearProgressIndicator()
              : Column(
                  children: [
                    // search bar
                    TextField(
                      decoration: InputDecoration(
                          hintText: 'Search products',
                          prefixIcon: const Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300),
                    ),

                    // grid of products
                    const SizedBox(height: 20),

                    // Filter and sorting options
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),

                                            // Drag indicator
                                            Container(
                                              width: 50,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            // show sort/filter options
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.sort,
                                    size: 18,
                                  ),
                                  Text("Sort")
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),

                                            // Drag indicator
                                            Container(
                                              width: 50,
                                              height: 5,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            // show sort/filter options
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.filter_alt_outlined,
                                    size: 18,
                                  ),
                                  Text("Filter")
                                ],
                              )),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            title: product.name,
                            price: '\$${product.price}',
                            imageUrl: product.image != null
                                ? '$bucketUrl/product_images/${product.image}'
                                : 'https://placehold.co/100x100/png',
                            onSelect: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProductView(id: product.id);
                              }));
                            },
                            onAdd: () => context
                                .read<AppBloc>()
                                .add(CartAdd(product: product)),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5.0,
                                mainAxisSpacing: 5.0,
                                childAspectRatio: 3 / 5),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
