// // data/data_sources/product_api_service.dart
// import 'package:dio/dio.dart';
// import '../models/product_model.dart';

// class ProductApiService {
//   final Dio _dio = Dio();

//   Future<List<Product>> fetchProducts() async {
//     final response = await _dio.get('https://dummyjson.com/products');
//     final data = response.data['products'] as List;
//     // log(data.toString());
//     return data.map((json) => Product.fromJson(json)).toList();
//   }
// }
import 'package:shopee/core/Api/dio_client.dart';


import '../../core/constants/app_constants.dart';
import '../models/product_model.dart';

class ProductRepository {
  final DioClient dioClient;

  ProductRepository(this.dioClient);

  Future<List<Product>> fetchProducts() async {
    final response = await dioClient.get(AppConstants.baseUrl + AppConstants.productsEndpoint);
    List productsJson = response.data['products'];
     for (var item in productsJson) {
    print('Category in response: ${item['category']}');
  }
    return productsJson.map((json) => Product.fromJson(json)).toList();
  }
}