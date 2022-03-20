import 'package:flutter/material.dart';
import 'package:flutter_app_carrito_de_compras/Products/ui/screens/products_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App e-commerce',
        home: ProductsPage()
      );
  }
}