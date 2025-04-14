import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {
  const FetchProducts();
}

class FetchProductById extends ProductEvent {
  final int id;

  const FetchProductById(this.id);

  @override
  List<Object> get props => [id];
}

class FetchCategories extends ProductEvent {
  const FetchCategories();
}

class FetchProductsByCategory extends ProductEvent {
  final String category;

  const FetchProductsByCategory(this.category);

  @override
  List<Object> get props => [category];
}
