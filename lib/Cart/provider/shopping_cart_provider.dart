
import 'package:flutter_app_carrito_de_compras/Products/model/products_model.dart';
import 'package:flutter/material.dart';

class ShoppingCartProvider extends ChangeNotifier {

  List<ProductsModel> _listProductsPurchased = [];

  List<ProductsModel> get listProductsPurchased {
    return _listProductsPurchased;
  }

  set selectedMenuOption(List<ProductsModel> list){
    _listProductsPurchased = list;
    notifyListeners();
  }
}