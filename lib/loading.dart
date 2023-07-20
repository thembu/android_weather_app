import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/GetWeather.dart';

class Loading extends StatefulWidget {



  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
String location = '';


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    location = ModalRoute.of(context)!.settings.arguments as String;
    fetchWeather();
    super.didChangeDependencies();
  }

  Future<void> fetchWeather() async {
    GetWeather weather = GetWeather(location: location);
    await weather.getData();
    Navigator.pushReplacementNamed(context, '/Home' , arguments: {
      'location' : location,
       'icon' : weather.imgUrl,
      'description': weather.description,
      'main' : weather.main
    }
    );
  }


  @override
  Widget build(BuildContext context) {


    return  Scaffold(
   body :SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(

        decoration: BoxDecoration(
          color: index.isEven ? Colors.blue : Colors.white,

        ),
      );
    },
    )
    );
  }
}
