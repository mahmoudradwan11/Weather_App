import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/core/controller/weather_cubit.dart';
import 'package:weather/core/controller/weather_states.dart';
import 'package:weather/core/manger/colors.dart';
import 'package:weather/core/manger/convert.dart';
import 'package:weather/core/manger/images_manger.dart';
import 'package:weather/core/manger/string.dart';
import 'package:weather/core/manger/values.dart';
import 'package:weather/screens/widget/build_pray_time_item.dart';
import 'package:weather/screens/widget/day_item.dart';
import 'package:weather/screens/widget/lottie_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = WeatherCubit.get(context);
          if (cubit.prayModel == null) {
            return Scaffold(
              body: SvgPicture.asset(
                AppImages.appBackGroundImage,
                fit: BoxFit.cover,
              ),
            );
          }
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      AppImages.appBackGroundImage,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.defaultColor),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        height: 40,
                        child: Center(
                          child: TextField(
                            style: TextStyle(color: AppColors.defaultColor),
                            controller: searchController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: AppString.search,
                                hintStyle:
                                    TextStyle(color: AppColors.greyColor),
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: AppColors.greyColor,
                                )),
                            onSubmitted: (value) {
                              cubit.getCityModel(value);
                              //navigateTo(context, const SearchScreen());
                            },
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 150,
                      left: 50,
                      right: 50,
                      child: Container(
                          height: 400,
                          width: 300,
                          child: const Image(
                              image: AssetImage(
                            AppImages.houseImage,
                          ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              ((cubit.currentCityModel!.name))
                                  .toString()
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: AppFontSize.fontSize25,
                                  color: AppColors.defaultColor),
                            ),
                            buildLottieItem(cubit
                                .currentCityModel!.weather![0].description),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (cubit.currentCityModel!.main!.temp -
                                          AppValues.kelvenTemp)
                                      .truncate()
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: AppFontSize.fontSize100,
                                      color: AppColors.defaultColor),
                                ),
                                Baseline(
                                  baseline: -25,
                                  baselineType: TextBaseline.alphabetic,
                                  child: Text(
                                    '\u00B0',
                                    style: TextStyle(
                                      fontSize: AppFontSize.fontSize30,
                                      color: AppColors.defaultColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Center(
                                    child: Text(
                                      ((cubit.currentCityModel!.weather![0]
                                              .description))
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: AppFontSize.fontSize20,
                                          color: AppColors.greyColor,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ('H:${(cubit.currentCityModel!.main!.tempMax - AppValues.kelvenTemp).truncate()}\u00B0'),
                                        style: TextStyle(
                                            color: AppColors.defaultColor),
                                      ),
                                      Text(
                                        ('L:${(cubit.currentCityModel!.main!.tempMin - AppValues.kelvenTemp).truncate()}\u00B0'),
                                        style: TextStyle(
                                            color: AppColors.defaultColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 220),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 250,
                                    color: Colors.transparent.withOpacity(0.4),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppString.forecast,
                                          style: TextStyle(
                                              color: AppColors.greyColor,
                                              fontSize: AppFontSize.fontSize20),
                                        ),
                                        const SizedBox(height: 5),
                                        Expanded(
                                          child: ListView.separated(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) =>
                                                  buildWeatherDayItem(cubit
                                                      .cityFive!.list![index]),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                              itemCount:
                                                  cubit.cityFive!.list!.length),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    AppColors.thirdColor,
                    AppColors.fourthColor,
                    AppColors.daleyColor
                  ])),
                  height: 600,
                  width: double.infinity,
                  child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Positioned(
                          top: 200,
                          right: -20,
                          child: SizedBox(
                            height: 250,
                            width: 280,
                            child: SvgPicture.asset(AppImages.moonImage),
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: SvgPicture.asset(
                            AppImages.masgedBackGround,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BuildSpecificationPrayItem(
                                  title: 'Fajr',
                                  subTitle: convertTimeTo12Hour(
                                      cubit.prayModel!.data!.timings!.fajr!),
                                  darkBackGroundColor:
                                      AppColors.prayItemColor.withOpacity(0.36),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BuildSpecificationPrayItem(
                                    title: 'Sunrise',
                                    subTitle: convertTimeTo12Hour(cubit
                                        .prayModel!.data!.timings!.sunrise!),
                                    darkBackGroundColor:
                                        AppColors.blackColor.withOpacity(0.36)),
                                const SizedBox(
                                  height: 5,
                                ),
                                BuildSpecificationPrayItem(
                                  title: 'Dhuhr',
                                  subTitle: convertTimeTo12Hour(
                                      cubit.prayModel!.data!.timings!.dhuhr!),
                                  darkBackGroundColor:
                                      AppColors.prayItemColor.withOpacity(0.36),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BuildSpecificationPrayItem(
                                    title: 'Asr',
                                    subTitle: convertTimeTo12Hour(
                                        cubit.prayModel!.data!.timings!.asr!),
                                    darkBackGroundColor:
                                        AppColors.blackColor.withOpacity(0.36)),
                                const SizedBox(
                                  height: 5,
                                ),
                                BuildSpecificationPrayItem(
                                  title: 'Maghrib',
                                  subTitle: convertTimeTo12Hour(
                                      cubit.prayModel!.data!.timings!.maghrib!),
                                  darkBackGroundColor:
                                      AppColors.prayItemColor.withOpacity(0.36),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BuildSpecificationPrayItem(
                                    title: 'Isha',
                                    subTitle: convertTimeTo12Hour(
                                        cubit.prayModel!.data!.timings!.isha!),
                                    darkBackGroundColor:
                                        AppColors.blackColor.withOpacity(0.36)),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppString.pray,
                                style: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: AppFontSize.fontSize25),
                              ),
                              Text(
                                '${cubit.currentCityModel!.name!} ',
                                style: TextStyle(
                                    color: AppColors.defaultColor,
                                    fontSize: AppFontSize.fontSize20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${cubit.prayModel!.data!.date!.gregorian!.day!} '
                                '${cubit.prayModel!.data!.date!.gregorian!.month!.en}, '
                                '${cubit.prayModel!.data!.date!.gregorian!.year}',
                                style: TextStyle(
                                    color: AppColors.defaultColor,
                                    fontSize: AppFontSize.fontSize15),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                              Text(
                                '${cubit.prayModel!.data!.date!.hijri!.day} '
                                '${cubit.prayModel!.data!.date!.hijri!.month!.en}, '
                                '${cubit.prayModel!.data!.date!.hijri!.year}',
                                style: TextStyle(
                                    color: AppColors.defaultColor,
                                    fontSize: AppFontSize.fontSize15),
                              ),
                            ],
                          ),
                        )
                      ]),
                ),
              ],
            ),
          ));
        });
  }
}
