class CurrentCityModel {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  MainClass? main;
  dynamic visibility;
  dynamic wind;
  Clouds? clouds;
  dynamic dt;
  Sys? sys;
  dynamic timezone;
  dynamic id;
  String? name;
  dynamic cod;

  CurrentCityModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CurrentCityModel.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
      base = json['base'];
      main = json['main'] != null ? MainClass.fromJson(json['main']) : null;
      visibility = json['visibility'];
      wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
      clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
      dt = json['dt'];
      sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
      timezone = json['timezone'];
      id = json['id'];
      name = json['name'];
      cod = json['cod'];
    }
  }
}

class Coord {
  dynamic lon;
  dynamic lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }
}

class Weather {
  dynamic id;
  String? main;
  String? description;
  String? icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class MainClass {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic humidity;
  dynamic seaLevel;
  dynamic grndLevel;

  MainClass(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});

  MainClass.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
  }
}

class Wind {
  dynamic speed;
  dynamic deg;
  dynamic gust;
  Wind({this.speed, this.deg, this.gust});
  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}

class Clouds {
  dynamic all;

  Clouds({this.all});

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class Sys {
  String? country;
  dynamic sunrise;
  dynamic sunset;

  Sys({this.country, this.sunrise, this.sunset});

  Sys.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}
