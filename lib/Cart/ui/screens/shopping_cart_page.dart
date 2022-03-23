
import 'package:flutter/material.dart';
import 'package:flutter_app_carrito_de_compras/Cart/provider/shopping_cart_provider.dart';
import 'package:flutter_app_carrito_de_compras/Cart/ui/widgets/increment_decrement_widget.dart';
import 'package:flutter_app_carrito_de_compras/Products/model/products_model.dart';
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';
import 'package:flutter_app_carrito_de_compras/widgets/bottom_nav_bar_widget.dart';
import 'package:provider/provider.dart';



class ShoppingCartPage extends StatefulWidget {
  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {

  
  //List<ProductsModel> listProductsPurchased = [];

//   List<ProductsModel> listProductsPurchased = [

//   ProductsModel(
//     id: 1, 
//     title: "Pencil",
//     price: 2,
//     description: "So beatiful Pencil",
//     image: 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'
//   ),

//   ProductsModel(
//     id: 2, 
//     title: "Colors",
//     price: 3,
//     description: "So beatiful Colors",
//     image: 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg'
//   ),

//   ProductsModel(
//     id: 3, 
//     title: "Oil Colors",
//     price: 5,
//     description: "So beatiful Colors",
//     image: 'https://images.freeimages.com/images/small-previews/bb8/squeezed-1192540.jpg'
//   )

// ];

  @override
  Widget build(BuildContext context) {

    final shoppingCartProvider = Provider.of<ShoppingCartProvider>(context);
    final productsPurchased =   shoppingCartProvider.listProductsPurchased;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MIS PRODUCTOS',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            IconButton(
              icon: Icon(Icons.cleaning_services_outlined),
               onPressed: (){
                setState(() {
                  productsPurchased.clear();         
                });
              },
            )
          ],
        ),
      ),
      body: productsPurchased.length == 0
      ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.remove_shopping_cart,
                color: kPrimaryColor,
                size: 150,              
              ),
            Text('Carrito vacio',   
              style: TextStyle(
                color: kTextTitleColor,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),         )
          ],
        )
      )
      : ListView.builder(
        itemCount: productsPurchased.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            margin: EdgeInsets.only(top: 5, bottom: 2, left: 5, right: 5),
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  kPrimaryColor.withOpacity(0.7),                  
                  kBackgroundColor.withOpacity(0.1),                                    
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
                    top: 10.0,
                    child: CircleAvatar(
                      minRadius: 30,
                      maxRadius: 60,
                      backgroundImage: NetworkImage(
                        productsPurchased[index].image
                      )   
                    ) 
                  ),                  
                  Positioned(
                    left: 160.0,
                    top: 10.0,
                    child:  Text(
                      productsPurchased[index].title,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          color: kTextTitleColor,
                          fontSize: 16
                      ),           
                    ),
                  ),
                  Positioned(
                    left: 160.0,
                    top: 30.0,
                    child: Text(
                      '\$'+ productsPurchased[index].price.toString(),
                      style: TextStyle(
                        color: kTextTitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160.0,
                    top: 50.0,
                    child: Text(
                      'Subtotal: \$'+ productsPurchased[index].price.toString(),
                      style: TextStyle(
                        color: kTextTitleColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70.0,
                    left: 160.0,
                    child: FloatingActionButton(
                      heroTag: productsPurchased[index].id,
                      mini: true,  
                      backgroundColor: kDangerColor.withOpacity(0.8),                  
                      onPressed: (){
                        setState(() {
                          productsPurchased.remove(productsPurchased[index]);         
                        });
                        },
                      child: Icon(Icons.delete)
                    ),                
                  ),
                  Positioned(
                    top: 75.0,
                    left: 220.0,
                    child: IncrementDecrementWidget()
                  )      
                ]
              )
            )
          );        
        }
      ),         
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}


