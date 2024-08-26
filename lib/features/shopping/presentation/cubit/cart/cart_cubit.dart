import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/shopping/domain/entities/cart_item.dart';
import 'package:clean_architecture/features/shopping/domain/usecases/post_make_order_usecase.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final PostMakeOrderUseCase _postMakeOrderUseCase;
  CartCubit(this._postMakeOrderUseCase) : super(CartInitial()) {
    _initial();
  }

  void _initial() {
    emit(const CartLoaded({}));
  }

  void makeOrder() async {
    try {
      if (state is CartLoaded) {
        final currentState = state as CartLoaded;
        final cartList = Map<int, CartItemEntity>.from(currentState.cartList);

        // Convert the cartList to a List<Map<String, dynamic>> for the API
        final List<Map<String, dynamic>> orderItems =
            cartList.entries.map((entry) {
          return {
            "product_id": entry.key,
            "quantity": entry.value.quantity,
          };
        }).toList();

        // Make the API call with the transformed data
        await _postMakeOrderUseCase(params: {
          "data": orderItems,
        });
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  void addCart(CartItemEntity newCartItem) {
    if (isClosed) return;
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final cartList = Map<int, CartItemEntity>.from(currentState.cartList);
      if (cartList.containsKey(newCartItem.id)) {
        cartList.update(
            newCartItem.id!,
            (value) => CartItemEntity(
                id: newCartItem.id,
                name: newCartItem.name,
                image: newCartItem.image,
                price: newCartItem.price,
                quantity: (value.quantity ?? 0) + (newCartItem.quantity ?? 1)));
      } else {
        cartList.putIfAbsent(
            newCartItem.id!,
            () => CartItemEntity(
                id: newCartItem.id,
                name: newCartItem.name,
                image: newCartItem.image,
                price: newCartItem.price,
                quantity: (newCartItem.quantity ?? 1)));
      }
      emit(CartLoaded(cartList));
    }
  }

  void removeCart(int cartItemId) {
    if (isClosed) return;
    if (state is CartLoaded) {
      final currentState = state as CartLoaded;
      final cartList = Map<int, CartItemEntity>.from(currentState.cartList);

      if (cartList.containsKey(cartItemId)) {
        if (cartList[cartItemId]!.quantity! > 1) {
          cartList.update(
              cartItemId,
              (value) => CartItemEntity(
                  id: cartList[cartItemId]?.id,
                  name: cartList[cartItemId]?.name,
                  image: cartList[cartItemId]?.image,
                  price: cartList[cartItemId]?.price,
                  quantity: (cartList[cartItemId]?.quantity ?? 0) - 1));
        } else {
          cartList.remove(cartItemId);
        }
        emit(CartLoaded(cartList));
      } else {
        print("Item not found in cart");
      }
    }
  }

  void removeAll() {
    if (isClosed) return;
    if (state is CartLoaded) {
      emit(const CartLoaded({}));
    } else {
      print("Item not found in cart");
    }
  }
}
