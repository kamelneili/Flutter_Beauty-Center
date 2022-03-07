import 'package:beautycentre/blocs/user/auth_event.dart';
import 'package:beautycentre/blocs/user/auth_state.dart';
import 'package:beautycentre/blocs/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/User/user_repository.dart';
//import 'package:newsapp/api/authentication_api.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //AuthenticationAPI authenticationAPI = AuthenticationAPI();
  bool isLoading = false;

  bool loginError = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late UserBloc authBloc;
  late UserRepository repo;
  late UserRepository _userRepository;

  late String username;
  late Key btn1;
  late Key btn2;
  @override
  void initState() {
    authBloc = BlocProvider.of<UserBloc>(context);
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
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
        title: Text('LOGIN'),
      ),
      body: SingleChildScrollView(
        child: BlocListener<UserBloc, AuthState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is LoginLoadingState) {
              _drawLoading();
            } else if (state is UserLoginSuccessState) {
              Navigator.pushNamed(context, '/home');
            }
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: (isLoading) ? _drawLoading() : _drawLoginForm(),
          ),
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
                  _userRepository.inputData;

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
            controller: email,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your username';
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
                context.read<UserBloc>().add(LoginButtonPressed(
                      password: password.text,
                      email: email.text,
                    ));
              },
              child: Text(
                'LOGIN',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Text(
            "Don't have an account?",
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.black,
                ),
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
                Navigator.of(context).pushNamed(
                  '/sign_up',
                );
              },
              child: Text(
                'Sign up',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
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
