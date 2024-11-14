import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/core/manger/lottie.dart';

Widget buildLottieItem(description) {
  if (description == 'overcast clouds') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.overcastSky));
  } else if (description == 'broken clouds') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.brokenSky));
  } else if (description == 'clear sky') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.clearSky));
  } else if (description == 'few clouds') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.fewSky));
  } else if (description == 'scattered clouds') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.scatteredSky));
  } else if (description == 'light rain') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.rainSky));
  } else if (description == 'drizzle') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.drizzleSky));
  } else if (description == 'moderate rain') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.stormSky));
  } else if (description == 'haze') {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.hazeSky));
  } else {
    return SizedBox(
        height: 80, width: 80, child: Lottie.asset(AppAnimation.snowSky));
  }
}
