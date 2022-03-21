
import 'dart:convert';
import 'dart:ui';
import 'package:flutter_app_carrito_de_compras/Products/model/products_model.dart';
import 'package:flutter_app_carrito_de_compras/Products/ui/screens/products_detail_page.dart';
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget {

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  List<ProductsModel> listProducts = [];

  Future<ProductsModel> getProducts() async {

     var uri = Uri.https(
      'fakestoreapi.com',
      '/products',
    );

    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      List<ProductsModel> list = (json.decode(resp.body) as List)
      .map((data) => ProductsModel.fromJson(data))
      .toList();
      
      setState(() {
        listProducts = list;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context, ) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'MIS PRODUCTOS',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listProducts.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.only(top: 5, bottom: 2, left: 5, right: 5),
            height: 170,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [                  
                  kBackgroundColor.withOpacity(0.1),
                  kPrimaryColor.withOpacity(0.7),                  
                ]
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
              ),
              child: Stack(
                children:[
                  Positioned(
                    left: 0.0,
                    child: CircleAvatar(
                      minRadius: 30,
                      maxRadius: 60,
                      backgroundImage: NetworkImage(
                        listProducts[index].image
                      )   
                    ) 
                  ),
                  Positioned(
                    left: 80.0,
                    bottom: 30.0,
                    child: FloatingActionButton(
                      heroTag: listProducts[index].id,
                      mini: true,  
                      backgroundColor: kDangerColor.withOpacity(0.8),                  
                      onPressed: (){},
                      child: Icon(Icons.add_shopping_cart)
                    ),                
                  ),
                  Positioned(
                    left: 40.0,
                    bottom: 5.0,
                    child: Text(
                      '\$'+ listProducts[index].price.toString(),
                      style: TextStyle(
                        color: kTextTitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Positioned(
                    left: 150,
                    right: 0.0,
                    top: 15.0,
                    child:  Text(
                      listProducts[index].title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: kTextTitleColor,
                          fontSize: 16
                      ),           
                    ),
                  ),
                  Positioned(    
                    right: 0.0,
                    bottom: 0.0,
                    child:  TextButton(                      
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsDetailPage(
                              id: listProducts[index].id,
                              title: listProducts[index].title,
                              description: listProducts[index].description,
                              rating: listProducts[index].rating,
                              price: listProducts[index].price,
                              image: listProducts[index].image
                            )
                          ), 
                        );
                      }, 
                      child: Text('Ver detalles',
                      style: TextStyle(
                        color: kBackgroundColor,
                        fontSize: 16
                      ),
                      textAlign: TextAlign.right)
                    )
                  )
                ]
              )
            )
          );        
        }
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
    );
  }
}