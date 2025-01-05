import 'package:ev/presentation/features/product/busnisslayer/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<ProductModel> productModel;

  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoaded) {
          productModel = state.productList;

          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding:const EdgeInsets.symmetric(horizontal: 24),
                child: SafeArea(
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: productModel.map((product) {
                return ProductWidget(productModel: product);
                }).toList(),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(child: Text("Error loading products"));
        }
      },
    );
  }
}
class ProductWidget extends StatelessWidget {
  final ProductModel? productModel;
  const ProductWidget({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.cyan, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    productModel!.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 80,
              child: Text(productModel!.title,
                style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                  overflow: TextOverflow.ellipsis
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 150,
              child: Text(productModel!.description,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("EGP${productModel!.price.toString()}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis
                  ),),
                const SizedBox(width: 15,),
                const Text("2000EGP",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,

                  ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text("Review (${productModel!.rating.rate})",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis
                  ),),const SizedBox(width: 5,),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const SizedBox(width: 25,),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.indigo,
                    shape: BoxShape.circle
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
