
import 'package:flutter_app_carrito_de_compras/utils/constanst.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatefulWidget {

  @override
  State<IncrementDecrementWidget> createState() => _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {

  int cantidad = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 110,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: kTextTitleColor,),
              onPressed: () {
                setState(() {
                  cantidad--;
                  if(cantidad<1){
                    cantidad = 1;
                  }
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  cantidad.toString(),
                  style: TextStyle(
                    fontSize: 14,
                    color: kTextTitleColor,
                  ),                                
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add,  color: kTextTitleColor,),
              onPressed: () {
                setState(() {
                  cantidad++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}