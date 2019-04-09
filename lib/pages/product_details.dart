import 'package:flutter/material.dart';

import 'package:shopapp/pages/home.dart';

class ProductDetails extends StatefulWidget {
  final productDetailName;
  final productDetailPrice;
  final productDetailOldPrice;
  final productDetailPicture;
  final List<String> productDetailSize;

  ProductDetails(
      {this.productDetailName,
      this.productDetailSize,
      this.productDetailOldPrice,
      this.productDetailPicture,
      this.productDetailPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity;
  String size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage()));
          },
          child: Text(widget.productDetailName,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.right),
        ),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {})
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 340.0,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.productDetailPicture),
                ),
                footer: Container(
                  //padding: EdgeInsets.only(left:90),
                  color: Colors.white70,
                  child:  Padding(
                           padding: EdgeInsets.only(left:100),
                           child: Column(children: <Widget>[
                    Row(children: <Widget>[
                      new Text(
                          widget.productDetailName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      
                    ]),
                    Row(children: <Widget>[
                      
                       
                    
                            new Text(
                              
                              "₺${widget.productDetailPrice}",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                            
                          ),
                     
                           Divider(indent: 10,),
                        new Text(
                          "₺${widget.productDetailOldPrice}",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey),
                        ),
                    ])
                  ]),
                )),
          )),
          Row(
            children: <Widget>[
              //====================== the size button ====================

              Expanded(child:
                Padding(padding: EdgeInsets.only(left:8),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  splashColor: Colors.blue,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: new Text("Size"),),
                      Expanded(
                        child: new DropdownButton<String>(value:size ,
                          hint: Text("Size"),
                          items: widget.productDetailSize.map((size) {
                            return new DropdownMenuItem<String>(
                              value: size,
                              child: new Text(
                                size,
                                style: TextStyle(fontSize: 10),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              size = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )),
             Expanded(child:
                Padding(padding: EdgeInsets.only(right:4),
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                       Expanded(child: new Text("Quantity"),),

                      Expanded(
                        
                        child: new DropdownButton<int>(
                        elevation: 0,
                          value: quantity,
                          hint: new Text("Quantity"),
                          items: <int>[1, 2, 3, 4, 5, 6].map((quantity) {
                            return new DropdownMenuItem<int>(
                              value: quantity,
                              child: new Text(quantity.toString()),
                            );
                          }).toList(),
                          onChanged: (int newValue) {
                            setState(() {
                              quantity = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ) ],
          ),
          Row(children: <Widget>[
            //====================== the size button ====================
            Expanded(
              child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  child: new Text("Buy Now")),
            ),
            new IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: () {}),
            new IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {}),
          ]),
          new ListTile(
            title: new Text("Product details"),
            subtitle: new Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eu pharetra turpis. Nunc venenatis nisl ac sapien luctus fermentum. Donec auctor dictum erat ut pellentesque. Nullam mi turpis, ultricies in felis nec, rutrum porttitor nulla. Ut bibendum varius ante. Praesent ullamcorper, magna vel venenatis fringilla, nisi metus viverra libero, in interdum sapien tortor malesuada urna. Morbi auctor eros id aliquet rutrum. Fusce vel tincidunt mauris. Donec consequat aliquet risus nec consequat. Morbi non elit vel arcu auctor bibendum. Aliquam eu eleifend orci. In hac habitasse platea dictumst. Etiam ipsum ipsum, pretium vitae nulla sit amet, lobortis vestibulum tellus."),
          ),
          Divider(),
          ListTile(
            title: new Text("Similiar Products"),
            subtitle: new Container(
              height: 190,
              child: SimilarProduct(),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class SimilarProduct extends StatefulWidget {
  @override
  _SimilarProductState createState() => _SimilarProductState();
}

class _SimilarProductState extends State<SimilarProduct> {
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
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress.jpg",
      "oldPrice": "85.00",
      "price": "80.00"
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress.jpg",
      "oldPrice": "85.00",
      "price": "80.00"
    },
    {
      "name": "Dress",
      "picture": "assets/images/products/dress.jpg",
      "oldPrice": "85.00",
      "price": "80.00"
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
        scrollDirection: Axis.horizontal,
        addSemanticIndexes: true,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (BuildContext context, int index) {
          return SimilarProducts(
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodOldPrice: productList[index]['oldPrice'],
              prodPrice: productList[index]['price']);
        });
  }
}

class SimilarProducts extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldPrice;
  final prodPrice;

  SimilarProducts(
      {this.prodName, this.prodPrice, this.prodOldPrice, this.prodPicture});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text(prodName),
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
                                  fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                          ),
                          new Text(
                            "\₺$prodPrice",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 10.0,
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
