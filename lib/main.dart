import 'package:ecommerce_provider/screen/cart/view/cart_screen.dart';
import 'package:ecommerce_provider/screen/detail/view/detail_screen.dart';
import 'package:ecommerce_provider/screen/home/provider/home_provider.dart';
import 'package:ecommerce_provider/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => HomeScreen(),
          'detail_screen': (context) => DetailScreen(),
          'cart_screen': (context) => CartScreen(),
        },
      ),
    ),
  );
}
