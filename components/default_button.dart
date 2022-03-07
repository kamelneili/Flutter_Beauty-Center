import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 6),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockSizeHorizontal! * 6,
            vertical: SizeConfig.blockSizeHorizontal! * 4),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
