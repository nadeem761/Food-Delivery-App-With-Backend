import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/dimenesions.dart';

class IconsTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconsTextWidget(
      {Key? key,
      required this.icon,
      required this.text,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5,
        ),
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.icon15,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
