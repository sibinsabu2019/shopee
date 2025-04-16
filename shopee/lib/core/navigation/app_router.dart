import 'package:flutter/material.dart';
import 'package:shopee/data/models/product_model.dart';
import 'package:shopee/presentation/Views/product_detail/product_detail_screen.dart';
import 'package:shopee/presentation/Views/splash/splas_screen.dart';

import 'package:shopee/presentation/views/login/login_screen.dart';
import 'package:shopee/presentation/views/home/home_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
        
      case '/productDetail':
        final product = settings.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
