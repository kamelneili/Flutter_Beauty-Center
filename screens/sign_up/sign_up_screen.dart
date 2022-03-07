import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:beautycentre/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  //AuthenticationAPI authenticationAPI = AuthenticationAPI();
  bool isLoading = false;

  bool loginError = false;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  //late AuthBloc authBloc;
  //late AuthRepository repo;
  late String username;

  @override
  void initState() {
    //authBloc = BlocProvider.of<AuthBloc>(context);
    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();

    TextEditingController phone = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('REGISTER'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: (isLoading) ? _drawLoading() : _drawLoginForm(),
        ),
      ),
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Login Error'),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    loginError = false;
                  });
                },
                child: Text(
                  'try Again',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: name,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          TextFormField(
            controller: phone,
            decoration: InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone';
              }
              return null;
            },
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your Email';
              }
              return null;
            },
          ),
          SizedBox(
            height: 48,
          ),
          TextFormField(
            obscureText: true,
            controller: password,
            decoration: InputDecoration(labelText: 'Password'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          SizedBox(
            height: 48,
          ),
          Container(
            width: 200,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                          )))),
              onPressed: () {
                context.read<UserBloc>().add(RegisterButtonPressed(
                    password: password.text,
                    email: email.text,
                    name: name.text,
                    phone: phone.text));
              },
              child: Text("SignUp"),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
