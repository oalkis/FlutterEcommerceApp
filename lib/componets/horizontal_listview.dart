import 'package:flutter/material.dart';

//Stateles --> Statik
//Statefull --> Dinamik
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
         
          Category(
            imageLocation: 'assets/images/categories/dress.png',
            imageCaption: 'Dress',
          ),
          Category(
            imageLocation: 'assets/images/categories/jacket.png',
            imageCaption: 'Jacket',
          ),
          Category(
            imageLocation: 'assets/images/categories/skirt.png',
            imageCaption: 'Skirt',
          ),
          Category(
            imageLocation: 'assets/images/categories/tshirt.png',
            imageCaption: 'T-Shirt',
          ),
          Category(
            imageLocation: 'assets/images/categories/top.png',
            imageCaption: 'Top',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Category({this.imageLocation, this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      
      //InkWell --> Buton gibi tıklamamızı sağlıyor.
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
        
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 60.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(imageCaption,style: TextStyle(fontWeight: FontWeight.w800),),
            ),
          ),
        ),
      ),
    );
  }
}
