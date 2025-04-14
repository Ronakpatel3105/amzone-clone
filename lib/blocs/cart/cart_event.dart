import 'package:equatable/equatable.dart';
import '../../models/product_model.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class LoadCart extends CartEvent {
  const LoadCart();
}

class AddProductToCart extends CartEvent {
  final Product product;
  final int quantity;

  const AddProductToCart({
    required this.product,
    this.quantity = 1,
  });

  @override
  List<Object> get props => [product, quantity];
}

class RemoveFromCart extends CartEvent {
  final int itemId;

  const RemoveFromCart(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class UpdateCartItemQuantity extends CartEvent {
  final int itemId;
  final int quantity;

  const UpdateCartItemQuantity({
    required this.itemId,
    required this.quantity,
  });

  @override
  List<Object> get props => [itemId, quantity];
}

class ClearCart extends CartEvent {
  const ClearCart();
}
