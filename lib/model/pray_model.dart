class PrayModel {
  dynamic code;
  String? status;
  Data? data;

  PrayModel({this.code, this.status, this.data});

  PrayModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  Timings? timings;
  DateModel? date;
  Data({this.timings, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    timings =
    json['timings'] != null ?  Timings.fromJson(json['timings']) : null;
    date = json['date'] != null ?  DateModel.fromJson(json['date']) : null;
  }

}

class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings(
      {this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha,
        this.imsak,
        this.midnight,
        this.firstthird,
        this.lastthird});

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    sunrise = json['Sunrise'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    sunset = json['Sunset'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
    imsak = json['Imsak'];
    midnight = json['Midnight'];
    firstthird = json['Firstthird'];
    lastthird = json['Lastthird'];
  }

}
class DateModel{
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  DateModel({this.readable, this.timestamp, this.hijri, this.gregorian});

  DateModel.fromJson(Map<String, dynamic> json) {
    readable = json['readable'];
    timestamp = json['timestamp'];
    hijri = json['hijri'] != null ? new Hijri.fromJson(json['hijri']) : null;
    gregorian = json['gregorian'] != null
        ? new Gregorian.fromJson(json['gregorian'])
        : null;
  }
}
class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Hijri(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,});

  Hijri.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ? new Weekday.fromJson(json['weekday']) : null;
    month = json['month'] != null ? new Month.fromJson(json['month']) : null;
    year = json['year'];
    }
}
class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  Weekday.fromJson(Map<String, dynamic> json) {
    en = json['en'];
    ar = json['ar'];
  }
}

class Month {
  int? number;
  String? en;
  String? ar;

  Month({this.number, this.en, this.ar});

  Month.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
    ar = json['ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['en'] = this.en;
    data['ar'] = this.ar;
    return data;
  }
}

class Gregorian {
  String? date;
  String? format;
  String? day;
  WeekdayG? weekday;
  MonthG? month;
  String? year;
  Gregorian(
      {this.date,
        this.format,
        this.day,
        this.weekday,
        this.month,
        this.year,});

  Gregorian.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    format = json['format'];
    day = json['day'];
    weekday =
    json['weekday'] != null ? WeekdayG.fromJson(json['weekday']) : null;
    month = json['month'] != null ? MonthG.fromJson(json['month']) : null;
    year = json['year'];
  }

}
class WeekdayG {
  String? en;

  WeekdayG({this.en});

  WeekdayG.fromJson(Map<String, dynamic> json) {
    en = json['en'];
  }
}

class MonthG{
  dynamic number;
  String? en;

  MonthG({this.number, this.en});

  MonthG.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    en = json['en'];
  }
}


