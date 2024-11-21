abstract class WeatherStates {}

class WeatherInitialState extends WeatherStates {}

class WeatherLoadingState extends WeatherStates {}

class WeatherGetState extends WeatherStates {}

class WeatherErrorState extends WeatherStates {}

class WeatherFiveDaysLoadingState extends WeatherStates {}

class WeatherFiveDaysState extends WeatherStates {}

class WeatherFiveDaysErrorState extends WeatherStates {}

class PrayTimeLoadingState extends WeatherStates {}

class PrayTimeGetState extends WeatherStates {}

class PrayTimeErrorState extends WeatherStates {}
