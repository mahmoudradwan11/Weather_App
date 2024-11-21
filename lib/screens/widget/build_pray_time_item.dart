import 'package:flutter/material.dart';
import 'package:weather/core/manger/colors.dart';
import 'package:weather/core/manger/values.dart';

class BuildSpecificationPrayItem extends StatelessWidget {
  Color darkBackGroundColor;
  String title;
  String subTitle;
  BuildSpecificationPrayItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.darkBackGroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: darkBackGroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: AppFontSize.fontSize15,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: double.infinity,
                child: Text(subTitle,
                    style: TextStyle(
                        color: AppColors.defaultColor,
                        fontSize: AppFontSize.fontSize15,
                        fontWeight: FontWeight.w500)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
