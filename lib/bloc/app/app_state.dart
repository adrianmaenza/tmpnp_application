part of 'app_bloc.dart';

class AppState {
  List<Product> cart;
  List<Product> favourites;
  Location? location;
  AuthResponse? auth;

  AppState(
      {
        this.cart = const <Product>[],
        this.location,
        this.favourites = const <Product>[],
        this.auth
      });

  AppState copyWith({List<Product>? cart, Location? location, List<Product>? favourites, AuthResponse? auth}) {
    return AppState(
        cart: cart ?? this.cart,
        location: location ?? this.location,
        favourites: favourites ?? this.favourites,
        auth: auth ?? this.auth
    );
  }
}
