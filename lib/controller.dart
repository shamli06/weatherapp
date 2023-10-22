import 'package:get/get.dart';
import 'package:weatherapp/model.dart';
import 'package:weatherapp/repository.dart';
class WeatherController extends GetxController{
  Repository repository = Repository();


  Rx<Weather>? weather = Weather().obs;
  RxList weatherList = [].obs;

  fetchData()async{
    weather!.value = await repository.fetchWeather();
    for(ListDays weather in weather!.value.list!.skip(1)){
      weatherList.add(weather);
      update();

    }

   update();
  }

  @override
  void onInit() {
    fetchData();

    super.onInit();
  }
}