part of 'app_bloc.dart';

class AppState {
  List<Product> cart;
  List<Product> favourites;
  Location? location;

  AppState(
      {
        this.cart = const <Product>[],
        this.location,
        this.favourites = const <Product>[]
      });

  AppState copyWith({List<Product>? cart, Location? location, List<Product>? favourites}) {
    return AppState(
        cart: cart ?? this.cart,
        location: location ?? this.location,
        favourites: favourites ?? this.favourites
    );
  }
}
