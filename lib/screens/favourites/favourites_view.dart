import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/bloc/app/app_bloc.dart';
import 'package:tmpnp_application/screens/home_screen.dart';
import 'package:tmpnp_application/util/constants.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Favourites',
              ),
              titleTextStyle: const TextStyle(
                  color:
                  Color(secondaryColor),
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
              leading: IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              }, icon: const Icon(Icons.arrow_back)),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    const SizedBox(
                      height: 20,
                    ),

                    // Show items in favourites
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.favourites.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = state.favourites[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Product image
                                    SizedBox(
                                      width: 80,
                                      height: 80,
                                      child: Image.network(product.image != null
                                          ? '$bucketUrl/product_images/${product.image}'
                                          : 'https://placehold.co/100x100/png'),
                                    ),

                                    const SizedBox(
                                      width: 20,
                                    ),

                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // Aligns text to the left
                                      children: [
                                        Text(
                                          product.name,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '\$${product.price}',
                                          style: const TextStyle(
                                            color: Color(primaryColor),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Product price
                                    Row(
                                      children: [
                                        // reduce quantity
                                        IconButton(
                                          onPressed: () {
                                            context.read<AppBloc>().add(FavouriteRemove(product: product));
                                          },
                                          icon: const Icon(Icons.delete),
                                          color: const Color(primaryColor),
                                        ),

                                        // Increase quantity
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.favorite_outline),
                                          color: const Color(primaryColor),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),

                                    // Quantity controls
                                    Row(
                                      children: [
                                        // reduce quantity
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.remove_circle_outline),
                                          color: const Color(primaryColor),
                                        ),

                                        // quantity
                                        const Text("1"),

                                        // Increase quantity
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                              Icons.add_circle_outline),
                                          color: const Color(primaryColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
