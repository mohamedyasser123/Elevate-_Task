import 'package:dio/dio.dart';

import '../model/product_model.dart';

abstract class ProductRepo{
 Future<List<ProductModel>> product();
 late final Dio dio;

 ProductRepo() {
  dio = Dio(); // Initialize Dio here
}}