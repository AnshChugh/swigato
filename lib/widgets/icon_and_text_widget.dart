import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const IconAndTextWidget(
      {super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          SmallText(
            text: text,
            color: AppColors.textColor,
          )
        ],
      ),
    );
  }
}
