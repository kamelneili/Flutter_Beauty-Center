import 'package:beautycentre/app_router.dart';
import 'package:beautycentre/blocs/basket/basket_bloc.dart';
import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:beautycentre/config/theme.dart';
import 'package:beautycentre/repositories/User/user_repository.dart';
import 'package:beautycentre/screens/home/home_screen.dart';
import 'package:beautycentre/screens/sign_in/sign_in_screen.dart';
import 'package:beautycentre/screens/sign_up/sign_up_screen.dart';
import 'package:beautycentre/screens/splash/splash_screen.dart';
import 'package:beautycentre/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocOverrides.runZoned(
    () {
      runApp(MyApp(appRouter: AppRouter()));
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BasketBloc()..add(StartBasket())),
        BlocProvider(
            create: (context) => UserBloc(userRepository: UserRepository()))
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: SplashScreen(),
      ),
    );
  }
}
