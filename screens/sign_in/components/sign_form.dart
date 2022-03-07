import 'package:beautycentre/components/custom_surfix_icon.dart';
import 'package:beautycentre/components/form_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  // String email;
  // String password;
  bool remember = false;
  bool isLoading = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final List<String> errors = [];

  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  //AuthBloc authBloc;
  //AuthRepository repo;
  @override
  void initState() {
    //authBloc = BlocProvider.of<AuthBloc>(context);

    super.initState();
  }

  @override
  void dispose() {
    // _usernameController.dispose();
    //_passwordController.dispose();
    super.dispose();
  }

  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)
        ? Form(
            key: _formKey,
            child: Column(
              children: [
                buildEmailFormField(),
                SizedBox(height: (30)),
                buildPasswordFormField(),
                SizedBox(height: (30)),
                Row(
                  children: [
                    Checkbox(
                      value: remember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        setState(() {
                          remember = value!;
                        });
                      },
                    ),
                    Text("Remember me"),
                    Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/home'),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                ),
                FormError(errors: errors),
                SizedBox(height: (20)),
                DefaultButton(
                  text: "Continue",
                  press: () {
                    // if (_formKey.currentState!.validate()) {
                    //   authBloc.add(LoginButtonPressed(
                    //       email: email.text, password: password.text));
                    //   _formKey.currentState!.save();
                    //   // if all are valid then go to success screen
                    //   //KeyboardUtil.hideKeyboard(context);
                    //   Navigator.pushNamed(context,
                    //       '/home');
                    // }
                  },
                ),
              ],
            ),
          )
        : Text("error");
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: password,
      obscureText: true,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 1) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
