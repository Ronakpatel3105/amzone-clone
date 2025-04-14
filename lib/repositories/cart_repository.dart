import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_model.dart';
import '../models/product_model.dart';

class CartRepository {
  static const String cartKey = 'amazon_cart';

  Future<Cart> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString(cartKey);

    if (cartString != null) {
      return Cart.fromJson(json.decode(cartString));
    }

    return const Cart();
  }

  Future<void> saveCart(Cart cart) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cartKey, json.encode(cart.toJson()));
  }

  Future<Cart> addToCart(Product product, int quantity) async {
    final cart = await getCart();
    final existingItemIndex =
        cart.items.indexWhere((item) => item.product.id == product.id);

    List<CartItem> updatedItems = List.from(cart.items);
    double updatedTotal = cart.total;

    if (existingItemIndex >= 0) {
      // Item already exists in cart, update quantity
      final existingItem = cart.items[existingItemIndex];
      final updatedItem =
          existingItem.copyWith(quantity: existingItem.quantity + quantity);

      updatedItems[existingItemIndex] = updatedItem;
    } else {
      // Add new item to cart
      updatedItems.add(CartItem(
        id: DateTime.now().millisecondsSinceEpoch,
        product: product,
        quantity: quantity,
      ));
    }

    // Recalculate total
    updatedTotal = updatedItems.fold<double>(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));

    final updatedCart = cart.copyWith(
      items: updatedItems,
      total: updatedTotal,
    );

    await saveCart(updatedCart);
    return updatedCart;
  }

  Future<Cart> updateCartItemQuantity(int itemId, int quantity) async {
    final cart = await getCart();
    final existingItemIndex =
        cart.items.indexWhere((item) => item.id == itemId);

    if (existingItemIndex < 0) {
      return cart;
    }

    List<CartItem> updatedItems = List.from(cart.items);

    if (quantity <= 0) {
      // Remove item if quantity is 0 or less
      updatedItems.removeAt(existingItemIndex);
    } else {
      // Update quantity
      final existingItem = cart.items[existingItemIndex];
      final updatedItem = existingItem.copyWith(quantity: quantity);
      updatedItems[existingItemIndex] = updatedItem;
    }

    // Recalculate total
    final updatedTotal = updatedItems.fold<double>(
        0.0, (sum, item) => sum + (item.product.price * item.quantity));

    final updatedCart = cart.copyWith(
      items: updatedItems,
      total: updatedTotal,
    );

    await saveCart(updatedCart);
    return updatedCart;
  }

  Future<Cart> removeFromCart(int itemId) async {
    return updateCartItemQuantity(itemId, 0);
  }

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(cartKey);
  }
}
