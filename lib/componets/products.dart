import 'package:flutter/material.dart';
import 'package:shopapp/pages/product_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
    List<Product> productList = List();
  var isLoading = false;
  _fetchData() async {
    setState(() {
      isLoading = true;
    });
    final response =
        await http.get("https://api.jsonbin.io/b/5ca770690f4c9334823b0211");
    if (response.statusCode == 200) {
      productList = (json.decode(response.body) as List)
          .map((data) => new Product.fromJson(data))
          .toList();
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load products');
    }
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
              price: productList[index].price,
              oldPrice: productList[index].oldPrice);
              
              
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPicture;
  final oldPrice;
  final price;
  final isActive;
  
  SingleProd(
      {this.prodName, this.prodPicture,this.oldPrice,this.isActive,this.price});
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
                              "\$$price",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
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
  final int oldPrice;
  final int price;
  final bool isActive;

  Product._({this.title, this.image,this.categoryId,this.isActive,this.price,this.oldPrice});
  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product._(
      title: json['title'],
      image: json['image'],
      categoryId: json['categoryId'],
      oldPrice: json['oldPrice'],
      price:json['price'],
      isActive: json['isActive']
    );
  }
}