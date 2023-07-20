
import 'dart:convert';

import 'package:http/http.dart' as http;
class GetWeather {
 late String location;
 late String imgUrl;
 late String description;
 late String main;
 GetWeather({required this.location});
 
 Future<void> getData () async {

   String url = 'https://api.openweathermap.org/data/2.5/weather?q=${location}&appid=db55fd495de05a4013318dac00c8b2ae';

   http.Response res = await http.get(Uri.parse('$url'));

   Map data = jsonDecode(res.body);


   String icon = data['weather'][0]['icon'];
   main = data['weather'][0]['main'];
   description  = data['weather'][0]['description'];
   imgUrl = 'http://openweathermap.org/img/w/${icon}.png';
   print(data);

 }
 
}