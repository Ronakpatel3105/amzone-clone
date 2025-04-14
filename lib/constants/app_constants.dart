import 'package:flutter/material.dart';

class AppConstants {
  // App Colors
  static const Color primaryColor = Color(0xFF00A8E1); // Amazon Blue
  static const Color secondaryColor = Color(0xFFF3A847); // Amazon Orange
  static const Color backgroundColor = Color(0xFFF2F2F2);
  static const Color appBarColor = Color(0xFF00A8E1);
  static const Color cardColor = Colors.white;
  static const Color textPrimaryColor = Color(0xFF111111);
  static const Color textSecondaryColor = Color(0xFF555555);
  static const Color bottomNavColor = Colors.white;

  // App Text Styles
  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: textPrimaryColor,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: textSecondaryColor,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: textSecondaryColor,
  );

  // App Strings
  static const String appName = "Amazon Clone";
  static const String home = "Home";
  static const String account = "Account";
  static const String cart = "Cart";
  static const String menu = "Menu";
  static const String search = "Search Amazon";
  static const String dealOfDay = "Deal of the Day";
  static const String topCategories = "Shop by Category";
  static const String recommendedForYou = "Recommended for you";
  static const String topDeals = "Top Deals";
  static const String yourOrders = "Your Orders";
  static const String buyAgain = "Buy Again";
  static const String wishlist = "Wish List";

  // API Constants
  static const String baseUrl = "https://fakestoreapi.com";
  static const String productsEndpoint = "/products";
  static const String categoriesEndpoint = "/products/categories";
  static const String categoryProductsEndpoint = "/products/category";
}
