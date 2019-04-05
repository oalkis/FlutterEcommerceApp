import 'package:flutter/material.dart';

class CartProduct extends StatefulWidget {
  @override
  _CartProductState createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  var productsOnTheCart = [
    {
      "name": "Blazer",
      "picture": "assets/images/product/dress/aeropostaledress.jpg",
      "price": 20.00,
      "size": "M",
      "color": "red",
      "quantity": 4
    },
    {
      "name": "Skirt",
      "picture": "assets/images/products/skirt.jpg",
      "price": 30.00,
      "size": "M",
      "color": "blue",
      "quantity": 2
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress.jpg",
      "price": 80.00,
      "size": "M",
      "color": "orange",
      "quantity": 5
    }
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsOnTheCart.length,
        itemBuilder: (context, index) {
          return new SingleCardProduct(
            cartProdName: productsOnTheCart[index]["name"],
            cartProdPicture: productsOnTheCart[index]["picture"],
            cartProdColor: productsOnTheCart[index]["color"],
            cartProdPrice: productsOnTheCart[index]["price"],
            cartProdQuantity: productsOnTheCart[index]["quantity"],
            cartProdSize: productsOnTheCart[index]["size"],
          );
        });
  }
}

class SingleCardProduct extends StatelessWidget {
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdSize;
  final cartProdColor;
  final cartProdQuantity;

  SingleCardProduct({
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdPrice,
    this.cartProdSize,
    this.cartProdColor,
    this.cartProdQuantity,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//         =============LEADING SECTION============
contentPadding: EdgeInsets.all(10.0),
        leading:Container(child: new Image.asset(cartProdPicture),
           
        height: 80,width: 80,),
//         =============TITLE SECTION==============
 
        title: new Text(cartProdName),
//         =============SUBTITLE SECTION==============
        subtitle: new Column(
          children: <Widget>[
//        ROW INDSIDE THE COLUMN
            new Row(
              children: <Widget>[
                //SIZE ROW
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cartProdSize,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                //COLOR ROW
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0.0, 8.0, 0.0),
                  child: new Text(
                    "Color:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cartProdColor,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            //PRICE

            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\₺$cartProdPrice",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            )
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(
              icon: Icon(Icons.arrow_drop_up),
              onPressed: () {
               // addQuantity();
              },
            ),
            new Text("$cartProdQuantity"),
            new IconButton(
              icon: Icon(Icons.arrow_drop_down),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
  
}
