import 'package:flutter/material.dart';
import 'package:shopapp/pages/productDetails.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "picture": "assets/images/products/blazer.jpg",
      "oldPrice": "30.00",
      "price": "20.00"
    },
    {
      "name": "Skirt",
      "picture": "assets/images/products/skirt.jpg",
      "oldPrice": "25.00",
      "price": "20.00"
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress.jpg",
      "oldPrice": "85.00",
      "price": "80.00"
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodOldPrice: productList[index]['oldPrice'],
              prodPrice: productList[index]['price']);
              
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SingleProd(
      {this.prodName, this.prodPrice, this.prodOldPrice, this.prodPicture});
  @override
  Widget build(BuildContext context) {
    return
       Card(
        child: Hero(
          tag: prodName,
          child: Material(
              child: InkWell(
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                      //Passing the value
                      builder: (context) => new ProductDetails(
                            productDetailName: prodName,
                            productDetailOldPrice: prodOldPrice,
                            productDetailPicture: prodPicture,
                            productDetailPrice: prodPrice,
                          ))),
                  child: GridTile(
                    footer: Container(
                        color: Colors.white70,
                        child: new Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                prodName,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                            ),
                            new Text(
                              "\₺$prodPrice",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )),
                    child: Image.asset(
                      prodPicture,
                      fit: BoxFit.cover,
                    ),
                  ))),
        ),
      
    );
  }
}
