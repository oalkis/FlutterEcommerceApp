import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/componets/horizontal_listview.dart';
import 'package:shopapp/componets/products.dart';
import 'package:shopapp/pages/cart.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        showIndicator: true,
        boxFit: BoxFit.cover,
        borderRadius: true,
        images: [
          AssetImage('assets/images/1.jpg'),
          AssetImage('assets/images/2.jpg'),
          AssetImage('assets/images/3.jpeg'),
          AssetImage('assets/images/4.jpg'),
          AssetImage('assets/images/5.jpg'),
          AssetImage('assets/images/6.png'),
          AssetImage('assets/images/7.jpg'),
          AssetImage('assets/images/8.jpg'),
          AssetImage('assets/images/9.jpg'),
          AssetImage('assets/images/10.jpg'),
          AssetImage('assets/images/11.jpg'),
          AssetImage('assets/images/12.jpg'),
          AssetImage('assets/images/13.jpg'),
          AssetImage('assets/images/14.jpg'),
          AssetImage('assets/images/15.jpg')
        ],
        autoplay: true,
        animationCurve: Curves.elasticInOut,
        animationDuration: Duration(microseconds: 1000),
        dotSize: 6.0,
        indicatorBgPadding: 6,
        dotBgColor: Colors.red,
        dotColor: Colors.white,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: Text('G. Fashion',
            style: TextStyle(color: Colors.white), textAlign: TextAlign.right),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new ShoppingCart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text('Orkun Alkış'),
              accountEmail: Text('orkunalkis@gmail.com'),
              currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(
                  Icons.person,
                  color: Colors.yellow,
                  size: 45,
                ),
              )),
              decoration: new BoxDecoration(color: Colors.red),
            ),
//body
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.category, color: Colors.red),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.info),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          //cover image crousel begins here
          imageCarousel,
          //padding widget
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Categories',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18, color: Colors.black,fontFamily: "Arial")
            ),
          ),
          //Horizontal list view begins here
          HorizontalList(),
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Recent Products',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 18, color: Colors.black,fontFamily: "Arial"),
              ),
              ),
              //grid View)_
              
            Container(
              height: 250.0,
              child:Products(),
            )
        ],
      ),
    );
  }
}
