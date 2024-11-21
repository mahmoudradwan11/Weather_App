import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/manger/colors.dart';
import 'package:weather/core/manger/values.dart';
import 'package:weather/model/city_five_day_model.dart';
import 'package:weather/screens/widget/lottie_item.dart';

Widget buildWeatherDayItem(ListDays day) => Container(
      padding: const EdgeInsets.all(10),
      width: 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          AppColors.primeColor.withOpacity(0.5),
          AppColors.secColor
        ]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('h a').format(DateTime.parse(day.dtTxt!)),
            style: TextStyle(color: AppColors.defaultColor),
          ),
          Text(
            DateFormat('dd/MM').format(DateTime.parse(day.dtTxt!)),
            style: TextStyle(color: AppColors.defaultColor),
          ),
          buildLottieItem(day.weather![0].description),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                (day.main!.temp - AppValues.kelvenTemp).truncate().toString(),
                style: TextStyle(
                    fontSize: AppFontSize.fontSize20,
                    color: AppColors.defaultColor),
              ),
              Baseline(
                baseline: 2,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  '\u00B0',
                  style: TextStyle(
                    fontSize: AppFontSize.fontSize10,
                    color: AppColors.defaultColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
