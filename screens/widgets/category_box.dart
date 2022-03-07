import 'package:beautycentre/models/category_model.dart';
import 'package:beautycentre/models/produit_model.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Produit> restaurants = Produit.produits
        .where(
          (restaurant) => restaurant.tags.contains(category.name),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/produit-listing',
            arguments: restaurants);
      },
      child: Container(
          width: 80,
          margin: const EdgeInsets.only(right: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(category.image.toString()),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category.name,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
