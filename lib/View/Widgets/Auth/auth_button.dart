import 'package:flutter/material.dart';
import 'package:shop/Utils/theme.dart';
import 'package:shop/View/Widgets/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({required this.text,
    required this.onPressed,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: TextUtils(
        text: text,
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      style: ElevatedButton.styleFrom(
        primary: mainColor,
        minimumSize: const Size(360, 50),
      ),
    );
  }
}
