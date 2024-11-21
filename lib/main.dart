import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/controller/weather_cubit.dart';
import 'package:weather/core/controller/weather_states.dart';
import 'package:weather/core/manger/themes.dart';
import 'package:weather/screens/home.dart';
import 'core/controller/observer.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit()..getCityModel('Cairo'),
        child: BlocConsumer<WeatherCubit, WeatherStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Weather',
                  theme: lightTheme,
                  home: HomeScreen());
            }));
  }
}
