import 'package:beautycentre/models/produit_model.dart';
import 'package:beautycentre/screens/widgets/service_card.dart';
import 'package:flutter/material.dart';

class ProduitListingScreen extends StatelessWidget {
  final List<Produit> services;
  const ProduitListingScreen({
    Key? key,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: Colors.deepOrange[50],
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          // leading: IconButton(
          //icon: Icon(Icons.back, color: Colors.orange),
          //  onPressed: () {},
          //  ),
        ),
        body: ListView.builder(
          itemCount: services.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 210,
                child: serviceCard(service: services[index]));
          },
        ));
  }
}

//
