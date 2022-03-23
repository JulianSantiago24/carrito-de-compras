
import 'package:flutter_app_carrito_de_compras/Products/providers/ui_provider.dart';
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavBarWidget extends StatefulWidget {

  final int currentIndex;

  BottomNavBarWidget({
    this.currentIndex
  });

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {

  @override
  Widget build(BuildContext context) {
    
    final uiProvider = Provider.of<UiProvider>(context);

    return SalomonBottomBar(
      currentIndex: uiProvider.selectedMenuOption,
      onTap: (int i) => uiProvider.selectedMenuOption = i,
      items: [
        SalomonBottomBarItem(
          icon: Icon(Icons.home),
          title: Text('Productos'),
          selectedColor: kPrimaryColor,
        ),
        SalomonBottomBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Carrito'),
          selectedColor: kPrimaryColor,
        ), 
      ],
    );
  }
}