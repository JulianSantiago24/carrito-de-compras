
import 'package:flutter_app_carrito_de_compras/Cart/provider/shopping_cart_provider.dart';
import 'package:flutter_app_carrito_de_compras/Cart/ui/screens/shopping_cart_page.dart';
import 'package:flutter_app_carrito_de_compras/Products/providers/ui_provider.dart';
import 'package:flutter_app_carrito_de_compras/Products/ui/screens/products_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ShoppingCartProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App e-commerce',
        home: _HomePageBody(),        
      ),
    );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOption;
    
    switch ( currentIndex ) {
      case 0 :
        return ProductsPage();
        break;
      case 1 :
        return ShoppingCartPage();  
        break;
      default:
        return ProductsPage();
    }
  }
}