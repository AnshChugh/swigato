import 'package:flutter/material.dart';
import 'package:swigato/colors.dart';
import 'package:swigato/dimensions.dart';

class Paragraph extends StatefulWidget {
  final String text;
  const Paragraph({super.key, required this.text});

  @override
  State<Paragraph> createState() => _ParagraphState();
}

class _ParagraphState extends State<Paragraph> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? null : 3,
          overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: Dimensions.font15, color: AppColors.paraColor),
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Row(
            children: [
              Text(
                isExpanded ? "Read less" : "Read more",
                style: TextStyle(
                    color: AppColors.mainColor, fontWeight: FontWeight.w600),
              ),
              Icon(
                isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: AppColors.mainColor,
              )
            ],
          ),
        )
      ],
    );
  }
}
