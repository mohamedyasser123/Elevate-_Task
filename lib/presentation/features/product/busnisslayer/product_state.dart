part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
final class ProductLoaded extends ProductState {
  final List<ProductModel> productList;

  ProductLoaded(this.productList);
}

