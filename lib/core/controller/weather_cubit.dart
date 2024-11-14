import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/controller/weather_states.dart';
import 'package:weather/core/network/remote/api_constants.dart';
import 'package:weather/core/network/remote/dio_helper.dart';
import 'package:weather/model/city_five_day_model.dart';
import 'package:weather/model/current_city_model.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitialState());

  static WeatherCubit get(context) => BlocProvider.of(context);

  CurrentCityModel? currentCityModel;

  void getCityModel(city) {
    emit(WeatherInitialState());
    DioHelper.getData(
        url: ApiConstants.apiCurrentBase,
        query: {'q': city, 'appid': ApiConstants.myApiKey}).then((value) {
      currentCityModel = CurrentCityModel.fromJson(value.data);
      print(currentCityModel!.main!.temp);
      print(currentCityModel!.main!.pressure);
      emit(WeatherGetState());
      getCurrentWeatherForFiveDays(city);
    }).catchError((error) {
      print(error.toString());
      emit(WeatherErrorState());
    });
  }

  CityFive? cityFive;
  void getCurrentWeatherForFiveDays(city) {
    emit(WeatherFiveDaysLoadingState());
    DioHelper.getData(
        url: ApiConstants.apiFiveDays,
        query: {'q': city, 'appid': ApiConstants.myApiKey}).then((value) {
      cityFive = CityFive.fromJson(value.data);
      print(cityFive!.list![0].dtTxt);
      print(cityFive!.list![1].weather![0].description);

      emit(WeatherFiveDaysState());
    }).catchError((error) {
      print(error.toString());
      emit(WeatherFiveDaysErrorState());
    });
  }
}
