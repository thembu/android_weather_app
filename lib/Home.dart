import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weather_app/GetWeather.dart';
import 'package:weather_app/loading.dart';
import 'package:weather_app/chooseLocation.dart';


class Home extends StatefulWidget {


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {





  @override
  Widget build(BuildContext context)  {

   Map data = ModalRoute.of(context)?.settings.arguments as Map;

    String bgImg = '' ;

   if(data['main'] == 'Clear') {

     bgImg = 'clear.jpg';

   } else if (data['main'] == 'Thunderstorm') {
       bgImg = 'thunderstorm.jpg';

   }else if (data['main' ]== 'Drizzle') {
     bgImg = 'drizzle.jpg';

   }else if (data['main' ]== 'Rain') {
     bgImg = 'rain.jpg';
   }else if (data['main'] == 'Snow') {
     bgImg = 'snow.jpg';

   }else if (data['main'] == 'Mist' || data['main'] ==  'Smoke' ||data['main'] ==  'Haze' ||data['main'] ==  'Dust'||data['main'] ==  'Fog'||data['main'] ==  'Ash') {
     bgImg = 'atmosphere.jpg';

   }else if (data['main'] == 'Clouds') {
     bgImg = 'clouds.jpg';
   }



 print('assets/$bgImg');

   return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('${data['location']}'),
        centerTitle: true,
        leading:IconButton(icon: Icon(Icons.arrow_back), onPressed: () { Navigator.pushReplacementNamed(context, '/') ;},)
      ),


     body: Stack(
       fit: StackFit.expand,
       children: [
         Image.asset(
           'assets/$bgImg',
           filterQuality: FilterQuality.high,
           fit: BoxFit.cover,
         ),
         Container(
           padding: EdgeInsets.all(16.0),
           alignment: Alignment.center,
           child: Container(
             width: 250, // Adjust the width as desired
             height: 200, // Adjust the height as desired

             child: Card(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     height: 150, // Adjust the height as desired
                     width: double.infinity,
                     decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('${data['icon']}'))),
                     child: Column (
                       mainAxisAlignment: MainAxisAlignment.center,
                       children :<Widget> [

                   Padding(
                     padding: EdgeInsets.fromLTRB(10 , 93 , 10 , 10),
                     child: Text(
                       '${data['main']}',
                       style: TextStyle(
                         fontSize: 24.0,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                   Padding(
                     padding: EdgeInsets.symmetric(horizontal: 16.0),
                     child: Text(
                       '${data['description']}',
                       style: TextStyle(fontSize: 16.0),
                     ),
                   ),
]
                     )

                   )
                 ],




               ),
             ),
           ),
         ),
       ],
     ),


   );


  }
}
