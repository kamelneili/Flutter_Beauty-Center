

// import 'profile_menu.dart';
// import 'profile_pic.dart';

// class Body extends StatelessWidget {


   
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: Column(
//         children: [
//           ProfilePic(),
//           SizedBox(height: 20),
//           ProfileMenu(
//             text: "My Account",
//             icon: "assets/icons/User Icon.svg",
//             press: () => {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return AccountScreen();
//                   }))
//             },
//           ),
//           ProfileMenu(
//             text: "Notifications",
//             icon: "assets/icons/Bell.svg",
//             press: () {},
//           ),
//           ProfileMenu(
//             text: "Settings",
//             icon: "assets/icons/Settings.svg",
//             press: () {},
//           ),
//           ProfileMenu(
//             text: "Help Center",
//             icon: "assets/icons/Question mark.svg",
//             press: () {},
//           ),
//           BlocBuilder<AuthBloc, AuthState>(
//             builder: (context, state) {
//               return ProfileMenu(
//                 text: "Log Out",
//                 icon: "assets/icons/Log out.svg",
//                 press: () async {
                   

//                   BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                                     
//  SharedPreferences pref = await SharedPreferences.getInstance();
//  int userId = pref.getInt('id');
//         String token = pref.getString("token");
//        print(token);
//                   if(state is LogoutState){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return SignInScreen();
//                   }));
//                   }
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
