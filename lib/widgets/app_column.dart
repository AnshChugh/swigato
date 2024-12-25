import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/dimensions.dart';
import 'package:swigato/widgets/big_text.dart';
import 'package:swigato/widgets/icon_and_text_widget.dart';
import 'package:swigato/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          color: AppColors.mainBlackColor,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "4.5",
              color: AppColors.textColor,
            ),
            SizedBox(
              width: 10,
            ),
            SmallText(
              text: "1287",
              color: AppColors.textColor,
            ),
            SizedBox(width: 10),
            SmallText(
              text: "comments",
              color: AppColors.textColor,
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle,
                text: "Normal",
                color: Colors.yellow.shade700),
            IconAndTextWidget(
                icon: Icons.location_on, text: "17km", color: Colors.cyan),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                color: Colors.red),
          ],
        ),
      ],
    );
  }
}
