import 'package:flutter/material.dart';

import '../config/styles.dart';

class MyFlatButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final Color? textColor;
  final Color? backgroundColor;

  const MyFlatButton(this.child,
      {super.key, this.onTap, this.textColor, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? Styles.primaryHighlightColor,
            foregroundColor: textColor ?? Colors.white,
            elevation: 1,
            textStyle: const TextStyle(
              fontFamily: Styles.primaryFontRegular,
              fontWeight: Styles.primaryFontWeightLight,
              fontSize: Styles.primaryButtonFontSize,
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            )),
        onPressed: onTap,
        child: child);
  }
}
