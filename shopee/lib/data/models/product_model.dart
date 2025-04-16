
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final double discountPercentage;
  final int stock;
  final String brand;
  final String thumbnail;
  final String category;


  final String returnPolicy;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.discountPercentage,
    required this.stock,
    required this.brand,
    required this.thumbnail,
    required this.category,


    required this.returnPolicy,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
  });


    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        price: (json['price'] ?? 0).toDouble(),
        rating: (json['rating'] ?? 0).toDouble(),
        discountPercentage: (json["discountPercentage"] ?? 0).toDouble(),
        stock: json['stock'] ?? 0,
        brand: json['brand'] ?? '',
        thumbnail: json['thumbnail'] ?? '',
        category: json['category'] ?? '',


        returnPolicy: json['returnPolicy'] ?? 'No return policy',
        warrantyInformation: json['warrantyInformation'] ?? 'No warranty info',
        shippingInformation: json['shippingInformation'] ?? 'No shipping info',
        availabilityStatus: json['availabilityStatus'] ?? 'Unavailable',
      );

}
