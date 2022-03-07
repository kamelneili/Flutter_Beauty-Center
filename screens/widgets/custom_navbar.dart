import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        // color: Colors.black,
        //  fixedColor: Colors.red,

        elevation: 0,
        color: Colors.transparent,
        child: BlocConsumer<UserBloc, AuthState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.home, color: Colors.grey)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.phone, color: Colors.grey)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          icon:
                              Icon(Icons.shopping_basket, color: Colors.grey)),
                      if (state is UnAuthenticated)
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign_in');
                            },
                            icon: Icon(Icons.person, color: Colors.grey))
                      else
                        IconButton(
                            onPressed: () {
                              context.read<UserBloc>().add(SignOutRequested());
                            },
                            icon: Icon(Icons.logout, color: Colors.grey))
                    ],
                  ));
            }));
  }
}
//icon: const Icon(Icons.logout)
 
                    //**** */
                   