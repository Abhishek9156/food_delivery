import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/app_color.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icons_and_text_widgets.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
                children: List.generate(5, (index) {
                  return Icon(Icons.star,
                      color: AppColors.mainColor, size: 15);
                })),
            const SizedBox(width: 10),
            SmallText(
              text: "4.5",
            ),
            const SizedBox(width: 10),
            SmallText(
              text: "1526",
            ),
            const SizedBox(width: 5),
            SmallText(
              text: "comments",
            )
          ],
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconsAndText(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconsAndText(
                icon: Icons.location_on,
                text: "17.2km",
                iconColor: AppColors.mainColor),
            IconsAndText(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2)
          ],
        )
      ],
    );

  }
}
