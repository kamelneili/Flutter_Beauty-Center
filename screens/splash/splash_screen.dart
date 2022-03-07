import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // super.initState();
    // new Future.delayed(
    //   const Duration(seconds: 3),
    //   // () => Navigator.push(
    //   //       context,
    //   //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //   //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image(
                    height: 350,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/logo.png'),
                  ),
                ),
                Container(
                  height: 70,
                  // color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Welcome to our Beauty Center',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white60),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                    child: Text("Get Started"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
