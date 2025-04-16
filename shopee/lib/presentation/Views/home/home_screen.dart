import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopee/core/Api/dio_client.dart';
import 'package:shopee/data/Repositories/product_repositories.dart';
import 'package:shopee/presentation/Views/widgets/product_card.dart';
import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_event.dart';
import '../../blocs/product/product_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  final List<String> categories = ['All', 'beauty', 'furniture'];
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(ProductRepository(DioClient()))
        ..add(FetchProducts()),
      child: Scaffold(
        backgroundColor: const Color(0xFFE8F5E9),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110),
          child: AppBar(
            backgroundColor: const Color(0xFF66BB6A),
            elevation: 0,
            centerTitle: true,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Product List',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  show == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(5)),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 0.5,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  show = true;
                                });
                              },
                              child: Text("Categories",style: TextStyle(color: Colors.white,fontSize: 10),),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 40,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 10),
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return ChoiceChip(
                                label: Text(category),
                                selected: selectedCategory == category,
                                selectedColor: Colors.white,
                                labelStyle: TextStyle(
                                  color: selectedCategory == category
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                backgroundColor: Colors.green.shade400,
                                onSelected: (bool selected) {
                                  setState(() {
                                    selectedCategory = category;
                                    show = false;
                                  });

                                  context
                                      .read<ProductBloc>()
                                      .add(FilterProductsByCategory(category));
                                },
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final delay = index * 300;

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeShimmer(
                            height: 130,
                            width: double.infinity,
                            radius: 10,
                            millisecondsDelay: delay,
                            fadeTheme: FadeTheme.light,
                          ),
                          const SizedBox(height: 10),
                          FadeShimmer(
                            height: 12,
                            width: double.infinity,
                            radius: 6,
                            millisecondsDelay: delay + 100,
                            fadeTheme: FadeTheme.light,
                          ),
                          const SizedBox(height: 6),
                          FadeShimmer(
                            height: 12,
                            width: 80,
                            radius: 6,
                            millisecondsDelay: delay + 150,
                            fadeTheme: FadeTheme.light,
                          ),
                          const Spacer(),
                          FadeShimmer(
                            height: 14,
                            width: 60,
                            radius: 6,
                            millisecondsDelay: delay + 200,
                            fadeTheme: FadeTheme.light,
                          ),
                          const SizedBox(height: 8),
                          FadeShimmer(
                            height: 36,
                            width: double.infinity,
                            radius: 8,
                            millisecondsDelay: delay + 250,
                            fadeTheme: FadeTheme.light,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            else if (state is ProductLoaded) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return ProductCard(product: product);
                  },
                ),
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text("Data is not valid"));
            }
          },
        ),
      ),
    );
  }
}