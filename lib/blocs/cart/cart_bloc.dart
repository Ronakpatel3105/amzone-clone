import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/cart_repository.dart';
import '../../models/cart_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(const CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(const CartLoading());
    try {
      final cart = await cartRepository.getCart();
      emit(CartLoaded(cart));
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> _onAddProductToCart(
      AddProductToCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        final updatedCart =
            await cartRepository.addToCart(event.product, event.quantity);
        emit(CartLoaded(updatedCart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> _onRemoveFromCart(
      RemoveFromCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        final updatedCart = await cartRepository.removeFromCart(event.itemId);
        emit(CartLoaded(updatedCart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> _onUpdateCartItemQuantity(
      UpdateCartItemQuantity event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        final updatedCart = await cartRepository.updateCartItemQuantity(
            event.itemId, event.quantity);
        emit(CartLoaded(updatedCart));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    if (state is CartLoaded) {
      try {
        await cartRepository.clearCart();
        emit(CartLoaded(const Cart()));
      } catch (e) {
        emit(CartError(e.toString()));
      }
    }
  }
}
