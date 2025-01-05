import 'package:dio/dio.dart';
import 'package:ev/presentation/features/product/data/model/product_model.dart';
import 'package:ev/presentation/features/product/data/repo/product_repo.dart';

class ProductImpl extends ProductRepo{

  @override
  Future<List<ProductModel>> product() async {
    try {
      Response response = await dio.get("https://fakestoreapi.com/products");
      print("API Response: ${response.data}");

      // Check if the response is a list
      if (response.data is List) {
        // Parse the response into a list of ProductModel
        return (response.data as List)
            .map((item) => ProductModel.fromJson(item))
            .toList();
      } else {
        throw Exception("Unexpected API response format");
      }
    } catch (e) {
      print("Error fetching products: $e");
      throw Exception("Failed to load products");
    }
  }

}