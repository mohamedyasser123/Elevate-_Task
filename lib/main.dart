import 'package:ev/presentation/features/product/busnisslayer/product_cubit.dart';
import 'package:ev/presentation/features/product/data/repo/product_impl.dart';
import 'package:ev/presentation/features/product/data/repo/product_repo.dart';
import 'package:ev/presentation/features/product/screen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productRepo = ProductImpl();

    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductCubit(productRepo),
        child: const ProductScreen(),
      ),
    );
  }
}


