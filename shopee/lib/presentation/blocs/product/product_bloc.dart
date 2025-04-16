// presentation/blocs/product/product_bloc.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/product_model.dart';
import '../../../data/Repositories/product_repositories.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository apiService ;
    List<Product> _allProducts = [];

  ProductBloc(this.apiService) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await apiService.fetchProducts();
        // log(products.toString());
         _allProducts = products; 
        emit(ProductLoaded(products));
      }catch (error, stackTrace) {
  log('FetchProducts Error: $error');
  log('StackTrace: $stackTrace');
  emit(ProductError(error.toString()));
}
    });
    on<FilterProductsByCategory>(_onFilterCategory);
    
  }
   void _onFilterCategory(
      FilterProductsByCategory event, Emitter<ProductState> emit) {
    if (event.category == "All") {
      emit(ProductLoaded(_allProducts));
    } else {
      
      final filtered = _allProducts
          .where((product) => product.category == event.category)
          .toList();
      emit(ProductLoaded(filtered));
      log(filtered.toString());
    }
      }
}