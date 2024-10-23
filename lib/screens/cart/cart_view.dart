import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/bloc/app/app_bloc.dart';
import 'package:tmpnp_application/screens/home_screen.dart';
import 'package:tmpnp_application/screens/order/order_view.dart';
import 'package:tmpnp_application/util/constants.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Trolley',
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
                    // Location Selector
                    DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(color: Colors.black)],
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.map_sharp, color: Color(primaryColor),),

                            const SizedBox(width: 10,),

                            Text(state.location != null ? state.location!.name.toString() : 'No location chosen'),

                            const Spacer(),

                            TextButton(
                              onPressed: () {},
                              child: const Text('Change',
                                  style: TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    // Show items in cart
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cart.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = state.cart[index];
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
                                            context.read<AppBloc>().add(CartRemove(product: product));
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

            // Bottom bar
              bottomNavigationBar: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // add some space
                        const SizedBox(width: 20),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderView()));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(primaryColor),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Checkout",
                                    style:
                                    TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ))
          );
        },
      ),
    );
  }
}
