import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopee/presentation/Views/widgets/icon_text.dart';
import '../../../data/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CupertinoActivityIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
            const SizedBox(height: 20),

 
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Text(
                    "(${product.warrantyInformation})",
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w200),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Text(
              product.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 10),

          
            Row(
              children: [
                RatingBarIndicator(
                  rating: product.rating,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.green,
                  ),
                  itemCount: 5,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                ),
                Text(" ${product.rating.toString()}"),
                const Text(
                  " . 236 ratings",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            const SizedBox(height: 20),

            if (product.discountPercentage >= 15.0)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Text(
                  "🔥 Hot Deal",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),
            const SizedBox(height: 7),

            Row(
              children: [
                Text(
                  '↓${product.discountPercentage.toStringAsFixed(2)}%  ',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '\$${(product.price / (1 - product.discountPercentage / 100)).toStringAsFixed(2)}',
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  ' \$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                const Icon(Icons.local_shipping),
                const SizedBox(width: 10),
                Text(product.shippingInformation),
              ],
            ),
            const Divider(),

            Row(
              children: [
                Text(
                  '. ${product.availabilityStatus}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  ' (${product.stock})',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                const Text(". Brand :"),
                Text(
                  product.brand,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Text(
              ". Category: ${product.category.toUpperCase()}",
              style: const TextStyle(color: Colors.black),
            ),
            const Divider(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconTextColumn(
                  icon: FontAwesomeIcons.reply,
                  text: "7 days replacement",
                  iconColor: Colors.blue,
                ),
                IconTextColumn(
                  icon: Icons.money,
                  text: "Cash on Delivery Available",
                  iconColor: Colors.green,
                ),
                IconTextColumn(
                  icon: Icons.assured_workload_rounded,
                  text: "S-Assured",
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
         
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Buy Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
