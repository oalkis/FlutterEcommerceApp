import 'package:flutter/material.dart';
import 'package:shopapp/pages/product_details.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}
    List<Product> productList = List();

class _ProductsState extends State<Products> {
  var isLoading = false;
  _fetchData() async {
    setState(() {
      isLoading = true;
    });

  //   final response = await 
  //       await http.get("https://api.jsonbin.io/b/5ca770690f4c9334823b0211");
  //   if (response.statusCode == 200) {
  //     productList = (json.decode(response.body) as List)
  //         .map((data) => new Product.fromJson(data))
  //         .toList();
  //     setState(() {
  //       isLoading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load products');
  //   }
  
    final response =  
        await rootBundle.loadString('assets/database/db.json');  
  productList = (json.decode(response) as List)
      .map((data) => new Product.fromJson(data))
         .toList();
      setState(() {
       isLoading = false;
      });
      }
  @override
  
  Widget build(BuildContext context) {
        _fetchData();

    return GridView.builder(
      
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            
              prodName: productList[index].title,
              prodPicture: productList[index].image,
              prodPrice: productList[index].price,
              prodOldPrice: productList[index].oldPrice,
              prodSize: productList[index].size,);
              
              
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;
  final prodIsActive;
  final prodSize;
  
  SingleProd(
      {this.prodName, this.prodPicture,this.prodOldPrice,this.prodIsActive,this.prodPrice,this.prodSize});
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
                            productDetailPicture: prodPicture,
                            productDetailOldPrice: prodOldPrice,
                            productDetailPrice: prodPrice,
                            productDetailSize: prodSize,
                           
                          ))),
                  child: GridTile(
                    footer: Container(padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                        color: Colors.white70,
                        child: new Row(
                          children: <Widget>[
                            Expanded(
                            
                              child: Text(
                                prodName,textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    ),
                              ),
                            ),
                            new Text(
                              "\$$prodPrice",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13)
                            )
                          ],
                        )),
                    child: Image.asset(
                      prodPicture,
                      fit: BoxFit.fitHeight,
                    ),
                  ))),
        ),
      
    );
  }
}
class Product {
  final String title;
  final String image;
  final int categoryId;
  final double oldPrice;
  final double price;
  final bool isActive;
  final List<String> size;

  Product._({this.title, this.image,this.categoryId,this.isActive,this.price,this.oldPrice,this.size});
  factory Product.fromJson(Map json) {
    return new Product._(
      title: json['title'],
      image: json['image'],
      categoryId: json['categoryId'],
      oldPrice: json['oldPrice'],
      price:json['price'],
      isActive: json['isActive'],
      size:json['size'].cast<String>()
    );
  }
}