import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tmpnp_application/models/product.dart';
import 'package:tmpnp_application/services/auth_service.dart';

import '../../models/location.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends HydratedBloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<CartAdd>(
      (event, emit) {
        // add a product to cart
        List<Product> curr = [...state.cart];
        if (!curr.contains(event.product)) curr.add(event.product);

        emit(state.copyWith(cart: curr));
      },
    );

    on<CartRemove>(
      (event, emit) {
        // remove a product to cart
        List<Product> curr = [...state.cart];

        curr.removeWhere((item) => item.id == event.product.id);

        emit(state.copyWith(cart: curr));
      },
    );

    on<FavouriteAdd>(
      (event, emit) {
        // add a product to cart
        List<Product> curr = [...state.favourites];

        if (!curr.contains(event.product)) curr.add(event.product);

        emit(state.copyWith(favourites: curr));
      },
    );

    on<FavouriteRemove>(
      (event, emit) {
        // remove a product to cart
        List<Product> curr = [...state.favourites];

        curr.removeWhere((item) => item.id == event.product.id);

        emit(state.copyWith(favourites: curr));
      },
    );

    on<Login>(
      (event, emit) {
        emit(state.copyWith(auth: event.auth));
      },
    );

    on<CartSetLocation>((event, emit) {
      emit(state.copyWith(location: event.location));
    });
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    try {
      // Deserialize the cart list
      List<Product> cart = (json['cart'] as List<dynamic>).map((item) {
        return Product.fromJson(item as Map<String, dynamic>);
      }).toList();

      List<Product> favourites =
          (json['favourites'] as List<dynamic>).map((item) {
        return Product.fromJson(item as Map<String, dynamic>);
      }).toList();

      // Deserialize location if it exists (nullable)
      Location? location = json['location'] != null
          ? Location.fromJson(json['location'] as Map<String, dynamic>)
          : null;

      AuthResponse? auth = json['auth'] != null
          ? AuthResponse.fromJson(json['auth'] as Map<String, dynamic>)
          : null;

      // Return a CartState with the deserialized cart and location
      return AppState(cart: cart, location: location, favourites: favourites, auth: auth);
    } catch (e) {
      // Return null if deserialization fails
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return {
      'cart': state.cart
          .map((product) => {
                'id': product.id,
                'name': product.name,
                'description': product.description,
                'price': product.price,
                'image': product.image,
              })
          .toList(),
      'location': state.location?.toJson(),
      'favourites': state.favourites
          .map((product) => {
                'id': product.id,
                'name': product.name,
                'description': product.description,
                'price': product.price,
                'image': product.image,
              })
          .toList(),
      'auth': state.auth?.toJson()
      // Assuming 'location' is a serializable field
    };
  }
}
