import 'package:beautycentre/models/produit_model.dart';
import 'package:beautycentre/screens/basket/basket_screen.dart';
import 'package:beautycentre/screens/delivery_time/delivery_time_screen.dart';
import 'package:beautycentre/screens/home/home_screen.dart';
import 'package:beautycentre/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:beautycentre/screens/sign_in/sign_in_screen.dart';
import 'package:beautycentre/screens/sign_up/sign_up_screen.dart';
import 'package:beautycentre/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/produit-listing':
        return MaterialPageRoute(
          builder: (_) => ProduitListingScreen(
              restaurants: settings.arguments as List<Produit>),
        );
      case '/delivery_time':
        return MaterialPageRoute(
          builder: (_) => DeliveryTimeScreen(),
        );
      case '/basket':
        return MaterialPageRoute(
          builder: (_) => BasketScreen(),
        );
      case '/sign_up':
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );
      case '/sign_in':
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
    }
  }
}
