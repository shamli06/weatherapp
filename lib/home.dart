import 'package:flutter/material.dart';
import 'package:weatherapp/controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {

  WeatherController controller = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.weather!.value.list!=null?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(controller.weather!.value.list![0].main!.temp.toString()+"°C",
                        style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue)),
                      Text(controller.weather!.value.list![0].weather![0].description.toString(),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),),
                      Text(DateFormat("EEEE").format(DateTime.parse(controller.weather!.value.list![0].dtTxt??"")),style: TextStyle(color: Colors.blue),),
                      Text(DateFormat("dd-MM-yyyy").format(DateTime.parse(controller.weather!.value.list![0].dtTxt??"")),style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.weatherList.length,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),color: Colors.blueAccent
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(controller.weatherList[index].main!.temp.toString()+"°C",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(controller.weatherList[index].weather![0].description.toString(),
                              style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text(DateFormat("hh:mm a").format(DateTime.parse(controller.weatherList[index].dtTxt??"")),style: TextStyle(color: Colors.white,fontSize: 15)),
                            Text(DateFormat("EEEE").format(DateTime.parse(controller.weatherList[index].dtTxt??"")),style: TextStyle(color: Colors.white,fontSize: 15)),
                            Text(DateFormat("dd-MM-yyyy").format(DateTime.parse(controller.weatherList[index].dtTxt??"")),style: TextStyle(color: Colors.white,fontSize: 15)),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ):Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}
