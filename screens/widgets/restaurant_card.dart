import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:beautycentre/models/produit_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantCard extends StatelessWidget {
  final Produit restaurant;
  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/details_restaurant',
            arguments: restaurant);
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  width: double.infinity,
                  height: 150,
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
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.fitWidth),
                  )),
              Positioned(
                  left: 10,
                  top: 40,
                  child: Container(
                      width: 100,
                      height: 30,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${restaurant.name}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: Colors.black),
                        ),
                      ))),
              Positioned(
                  left: 10,
                  top: 100,
                  child: Container(
                      width: 200,
                      height: 40,
                      padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child:
                              //
                              SizedBox(
                            height: 150,
                            child: BlocBuilder<UserBloc, AuthState>(
                                builder: (context, state) {
                              if (state is UnAuthenticated)
                                return TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sign_in');
                                  },
                                  child:
                                      //
                                      Text(
                                    'Make an appointment',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(color: Colors.black),
                                  ),
                                );
                              else if (state is UserLoginSuccessState) {
                                return TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/delivery_time');
                                  },
                                  child:
                                      //
                                      Text(
                                    'Make an appointment',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                );
                              } else {
                                return Text("error");
                              }
                            }),
                          ))))
            ],
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
