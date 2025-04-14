import 'package:equatable/equatable.dart';
import 'product_model.dart';

class Cart extends Equatable {
  final List<CartItem> items;
  final double total;

  const Cart({
    this.items = const <CartItem>[],
    this.total = 0.0,
  });

  @override
  List<Object?> get props => [items, total];

  Cart copyWith({
    List<CartItem>? items,
    double? total,
  }) {
    return Cart(
      items: items ?? this.items,
      total: total ?? this.total,
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<CartItem> items =
        (json['items'] as List).map((item) => CartItem.fromJson(item)).toList();

    return Cart(
      items: items,
      total: json['total'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
    };
  }
}

class CartItem extends Equatable {
  final int id;
  final Product product;
  final int quantity;

  const CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [id, product, quantity];

  CartItem copyWith({
    int? id,
    Product? product,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  double get subtotal => product.price * quantity;
}
