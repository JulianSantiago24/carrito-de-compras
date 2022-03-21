
import 'package:flutter/material.dart';
import 'package:flutter_app_carrito_de_compras/Products/model/products_model.dart';
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';

class ProductsDetailPage extends StatefulWidget {

  int id;
  String title;
  double price;
  String description;
  Rating rating;
  String image;

  ProductsDetailPage({
    this.id,
    this.title,
    this.price,
    this.description,
    this.rating,
    this.image
  });


  @override
  State<ProductsDetailPage> createState() => _ProductsDetailPageState();
}

class _ProductsDetailPageState extends State<ProductsDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        title: Text(
          'DETALLES',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.48),
                    height: 500,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)
                      )
                    ) 
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(widget.title,
                          style: TextStyle(
                            color: kPrimaryColor,                            
                            fontSize: 18                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('Ref. ${widget.id.toString()}',
                          style: TextStyle(
                            color: kTextTitleColor,                            
                            fontSize: 17                            //fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Row(
                          children: [
                            Column(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Precio\n",
                                        style: TextStyle(
                                        color: kPrimaryColor,                            
                                        fontSize: 18,
                                                                    //fontWeight: FontWeight.bold
                                        )
                                      ),
                                      TextSpan(text: '\$' + widget.price.toString(),
                                        style: TextStyle(
                                        color: kPrimaryColor,                            
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold                            //fontWeight: FontWeight.bold
                                        )
                                      ),                                                                                        
                                    ],                          
                                  )
                                ),
                                SizedBox(height: 60),                                
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(text: "Calificación\n",
                                        style: TextStyle(
                                        color: kPrimaryColor,                            
                                        fontSize: 18,
                                                                    //fontWeight: FontWeight.bold
                                        )
                                      ),
                                      WidgetSpan(
                                        child: Row(
                                          children: [
                                            Icon(Icons.star_rate, color: Colors.yellow[700]),
                                            Text(widget.rating.rate.toString()),
                                            Icon(Icons.person, color:kPrimaryColor),
                                            Text(widget.rating.count.toString()),                                          
                                          ],
                                        ),                                      
                                      ),
                                                                                                                           
                                    ],                          
                                  )
                                ),
                              ],
                            ),
                            
                                  

                            SizedBox(width: 30,),
                            Expanded(
                              child: Stack(
                                children:[
                                  Container(
                                  padding: EdgeInsets.all(20.0),
                                  height: 310,                                
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(widget.image),
                                  ),
                                ),Positioned(
                                  bottom: 40.0,
                                  right: 30.0,
                                  child: FloatingActionButton(
                                        heroTag: widget.id,
                                        mini: true,  
                                        backgroundColor: kDangerColor.withOpacity(0.8),                  
                                        onPressed: (){},
                                        child: Icon(Icons.add_shopping_cart)
                                      ),
                                ),]
                              ),                              
                            ),                           
                          ],                                                    
                        ),
                        widget.description.length >= 400
                        ? SizedBox(height: 30)
                        : SizedBox(height: 80),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "Descripción\n",
                                    style: TextStyle(                                    
                                    color: Colors.white,                            
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900                                                               //fontWeight: FontWeight.bold
                                    )
                                  ),
                                  TextSpan(text: widget.description,
                                    style: TextStyle(
                                    color: kTextTitleColor,                            
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700                          //fontWeight: FontWeight.bold
                                    )
                                  )                      
                                ],                          
                              )
                            ),
                      ],
                    ),
                  ),                                
                ],
              ),
            )
          ],
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
    );
  }
}