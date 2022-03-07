import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:beautycentre/models/category_model.dart';
import 'package:beautycentre/models/produit_model.dart';
import 'package:beautycentre/models/promo_model.dart';
import 'package:beautycentre/screens/widgets/category_box.dart';
import 'package:beautycentre/screens/widgets/custom_navbar.dart';
import 'package:beautycentre/screens/widgets/promo_box.dart';
import 'package:beautycentre/screens/widgets/restaurant_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        backgroundColor: Colors.black,
        //   appBar: CustomAppBar(),
        bottomNavigationBar: CustomNavBar(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(right: 5.0),
                      //width: double.infinity,
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(3, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/logo.png'),
                        ),
                      ))),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Category.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryBox(category: Category.categories[index]);
                    },
                  ),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: BlocBuilder<UserBloc, AuthState>(
                        builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            'Top PROMOS ',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            ' Beauty Center',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                          ),
                        ],
                      );
                    }),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 125,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: Promo.promos.length,
                      itemBuilder: (context, index) {
                        return PromoBox(promo: Promo.promos[index]);
                      },
                    )),
              ),
              //
              SizedBox(
                height: 20,
              ),

              //
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Text(
                          'Featured Services ',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          ' Beauty Center',
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 300,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(), // new

                    shrinkWrap: true,
                    itemCount: Produit.produits.length,
                    itemBuilder: (context, index) {
                      print(Produit.produits.length);

                      return RestaurantCard(
                          restaurant: Produit.produits[index]);
                    }),
              )
            ],
          ),
        )));
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
      title: Center(
          child: Container(
              margin: const EdgeInsets.only(right: 5.0),
              //width: double.infinity,
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/logo.png'),
                ),
              ))),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/wishlist');
              // Navigator.of(context).pushNamed(
              //   '/product',
              //   arguments: product,
              // );
            },
            icon: Icon(Icons.favorite, color: Colors.white)),
        Stack(
          children: [
            Positioned(
              top: 2.0,
              right: 15,
              child: Container(
                child: Center(),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                width: 18,
                height: 14,
              ),
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
      //

      //
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50.0);
}
