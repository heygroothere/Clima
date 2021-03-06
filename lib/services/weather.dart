import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

//const apiKey = 'cb0702aae2a431362884ea5115130f95';

class WeatherModel {
  Future<dynamic> getCityWeather(cityName) async {
    var uri = 'data/2.5/weather';
    Map<String, String> q = {
      "q": '$cityName',
      "appid": "cb0702aae2a431362884ea5115130f95",
      "units": "metric"
    };
    NetworkHelper networkHelper =
        NetworkHelper('api.openweathermap.org', uri, q);
    var weatherData = await networkHelper.getData();
    print(weatherData);
    print("hello");
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    var uri = 'data/2.5/weather';

    await location.getCurrentLocation();
    Map<String, String> q = {
      'lat': '${location.latitude}',
      "lon": '${location.longitude}',
      "appid": "cb0702aae2a431362884ea5115130f95",
      "units": "metric"
    };
    NetworkHelper networkHelper =
        NetworkHelper('api.openweathermap.org', uri, q);
    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
