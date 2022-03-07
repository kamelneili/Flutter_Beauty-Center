import 'package:beautycentre/models/promo_model.dart';
import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;
  const PromoBox({Key? key, required this.promo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(3, 0), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 2.0),
            width: MediaQuery.of(context).size.width - 40,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3, 0), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  promo.imageUrl,
                  //  'https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', // tags: ['Italian', 'Dessert', 'Ice Cream'],
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(right: 5.0),
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                //color: Theme.of(context).primaryColor,
                //  image: DecorationImage(
                //   image: NetworkImage(
                //     'https://images.unsplash.com/photo-1634046387041-db02e878d22b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=464&q=80',
                //   ),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15, right: 125),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(promo.title,
                          style: Theme.of(context).textTheme.headline4!),
                      SizedBox(
                        height: 15,
                      ),
                      Text(promo.description,
                          style: Theme.of(context).textTheme.headline6!)
                    ]),
              )),
        ],
      ),
    );
  }
}

class PromoCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(255, size.height);
    path.lineTo(275, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
