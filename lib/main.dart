import 'package:flutter/material.dart';
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Carrito de compras',
            style: TextStyle(
              color: Colors.white 
            ),
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
              'Productos',
              style: TextStyle(
              color: Colors.black 
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kPrimaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Productos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Carrito',
            ),      
          ],
        ),
      ),
    );
  }
}