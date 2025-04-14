import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/product_repository.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc({required this.productRepository})
      : super(const ProductInitial()) {
    on<FetchProducts>(_onFetchProducts);
    on<FetchProductById>(_onFetchProductById);
    on<FetchCategories>(_onFetchCategories);
    on<FetchProductsByCategory>(_onFetchProductsByCategory);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final products = await productRepository.fetchAllProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onFetchProductById(
      FetchProductById event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final product = await productRepository.fetchProductById(event.id);
      emit(ProductLoaded(product));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onFetchCategories(
      FetchCategories event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final categories = await productRepository.fetchCategories();
      emit(CategoriesLoaded(categories));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> _onFetchProductsByCategory(
      FetchProductsByCategory event, Emitter<ProductState> emit) async {
    emit(const ProductLoading());
    try {
      final products =
          await productRepository.fetchProductsByCategory(event.category);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}
