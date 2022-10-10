import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimenesions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String halftext;
  late String secondhalftext;
  bool hiddentext = true;
  double textheight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      halftext = widget.text.substring(0, textheight.toInt());
      secondhalftext =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      halftext = widget.text;
      secondhalftext = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalftext.isEmpty
          ? SmallText(
              color: AppColors.paraColor,
              size: Dimensions.fontsize16,
              text: halftext)
          : Column(
              children: [
                SmallText(
                    height: 1.8,
                    color: AppColors.paraColor,
                    size: Dimensions.fontsize16,
                    text: hiddentext
                        ? (halftext + "...")
                        : (halftext + secondhalftext)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddentext = !hiddentext;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                        text: "Show more",
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddentext
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
