import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/product_model.dart';
import '../data/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
final ProductRepo productRepo;
late  List<ProductModel>productModel;

Future<List<ProductModel>>getProductData()async{
  final fetchProductData=await productRepo.product();
productModel=fetchProductData as List<ProductModel>;
 emit(ProductLoaded(productModel));
 return productModel;

}
}
