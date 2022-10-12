import 'package:flutter/material.dart';

class ButtonUtil {
  const ButtonUtil._();

  static Widget buildCommonButton(
    BuildContext context, {
    double borderRadius = 18,
    double buttonHeight = 60,
    required void Function()? onPressed,
    required String buttonText,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
