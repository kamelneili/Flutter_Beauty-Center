import 'package:beautycentre/blocs/basket/basket_bloc.dart';
import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:beautycentre/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
//Theme.of(context).backgroundColor,
        appBar: AppBar(
          //backgroundColor: Theme.of(context).primaryColor,
          //elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('My Appointments',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white)),

          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/delivery_time');
                },
                icon: Icon(Icons.edit, color: Colors.white))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //***** */
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )))),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text("Go to home"),
                ),
              ),
            ],
          )),
        ),
        //*
        body: BlocListener<UserBloc, AuthState>(
            listener: (context, state) {
              if (state is UnAuthenticated) {
                // Navigate to the sign in screen when the user Signs Out
                Navigator.pushNamed(context, '/sign_in');
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    margin: const EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        color: Colors.white),
                    child: Row(
                      children: [
                        BlocBuilder<BasketBloc, BasketState>(
                          builder: (context, state) {
                            if (state is BasketLoading)
                              return Center(child: CircularProgressIndicator());
                            else if (state is BasketLoaded) {
                              return Text(
                                  'Appointment at ${DateFormat('yyyy-MM-dd').format(state.basket.date!)} '
                                  '${state.basket.deliveryTime!.value}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(color: Colors.black));
                            } else
                              return Text('something went wrong');
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
