import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';
import '../models/product_model.dart';

class ProductRepository {
  Future<List<Product>> fetchAllProducts() async {
    final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.productsEndpoint}'));

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = json.decode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> fetchProductById(int id) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.productsEndpoint}/$id'));

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product with id: $id');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.categoriesEndpoint}'));

    if (response.statusCode == 200) {
      final List<dynamic> categoriesJson = json.decode(response.body);
      return categoriesJson.map((category) => category.toString()).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response = await http.get(Uri.parse(
        '${AppConstants.baseUrl}${AppConstants.categoryProductsEndpoint}/$category'));

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = json.decode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products for category: $category');
    }
  }
}
