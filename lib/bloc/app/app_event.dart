part of '../../bloc/app/app_bloc.dart';

class AppEvent {}

class CartAdd extends AppEvent {
  final Product product;

  CartAdd({required this.product});
}

class FavouriteAdd extends AppEvent {
  final Product product;

  FavouriteAdd({required this.product});
}

class CartRemove extends AppEvent {
  final Product product;

  CartRemove({required this.product});
}

class FavouriteRemove extends AppEvent {
  final Product product;

  FavouriteRemove({required this.product});
}

class CartSetLocation extends AppEvent {
  final Location? location;

  CartSetLocation(this.location);
}

class Login extends AppEvent {
  final AuthResponse? auth;

  Login(this.auth);
}