import 'package:flutter/material.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('Shopping Cart',
            style: TextStyle(color: Colors.white), textAlign: TextAlign.right),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
        ],
      ),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(children: <Widget>[
          Expanded(child: ListTile(
          title: new Text("Total"),
          subtitle: new Text("\₺230"),
          
         ) ),
         Expanded(child: new MaterialButton(
           onPressed:(){},
           child: new Text("Check out",style:TextStyle(
             color:Colors.white
           ),),
           color: Colors.red,
           
         ),)
         ],),
      ),
    );
  }
}
