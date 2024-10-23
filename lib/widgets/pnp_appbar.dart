import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmpnp_application/bloc/app/app_bloc.dart';
import 'package:tmpnp_application/screens/cart/cart_view.dart';
import 'package:tmpnp_application/screens/favourites/favourites_view.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.add_business_outlined),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.local_offer),
                  onPressed: () => {},
                ),

                // Favourites
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavouritesView())),
                    ),
                    state.favourites.isNotEmpty
                        ? Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Text(
                                state.favourites.length.toString(),
                                // Replace with your dynamic count
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),

                // Shopping basket
                Stack(
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.shopping_cart),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartView())),
                    ),
                    state.cart.isNotEmpty
                        ? Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 20,
                                minHeight: 20,
                              ),
                              child: Text(
                                state.cart.length.toString(),
                                // Replace with your dynamic count
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
