import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shopee/data/models/product_model.dart';
import 'package:shopee/presentation/blocs/product/product_bloc.dart';
import 'package:shopee/presentation/blocs/product/product_event.dart';
import 'package:shopee/presentation/blocs/product/product_state.dart';

import '../../mocks/product_repository_test.mocks.dart'; // Import the generated mock

void main() {
  group('ProductBloc Tests', () {
    late ProductBloc productBloc;
    late MockProductRepository mockRepository;

    setUp(() {
      mockRepository = MockProductRepository();
      productBloc = ProductBloc(mockRepository);
    });

    tearDown(() {
      productBloc.close();
    });

    final mockProducts = [
      Product(
        id: 1,
        title: "Test Product",
        description: "Description",
        price: 10.0,
        discountPercentage: 5.0,
        rating: 4.0,
        stock: 20,
        brand: "Brand",
        thumbnail: "https://dummyjson.com/thumb.png",
        category: 'demo',
        returnPolicy: 'demo return',
        warrantyInformation: '1 year',
        shippingInformation: 'Ships in 2 days',
        availabilityStatus: 'In Stock',
      ),
    ];

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoading, ProductLoaded] when FetchProducts is added',
      build: () {
        when(mockRepository.fetchProducts())
            .thenAnswer((_) async => mockProducts);
        return ProductBloc(mockRepository);
      },
      act: (bloc) => bloc.add(FetchProducts()),
      expect: () => [
        ProductLoading(),
        ProductLoaded(mockProducts),
      ],
    );
  });
}
