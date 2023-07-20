import 'package:flutter/material.dart';
import 'package:weather_app/GetWeather.dart';
import 'package:weather_app/Home.dart';



String location = '';

class chooseLocation extends StatefulWidget {

   chooseLocation({super.key});
   @override
  State<chooseLocation> createState() => _chooseLocationState();
}



class _chooseLocationState extends State<chooseLocation> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }


   Submit_loc() {
    Navigator.pushReplacementNamed(context, 'load' , arguments: _textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            TextField(

              decoration:  InputDecoration(
              hintText: 'Choose Location',
              suffixIcon: IconButton(onPressed: () {_textEditingController.clear();}, icon: Icon(Icons.clear)),
              border: OutlineInputBorder()

        ),
              controller: _textEditingController,
            ),
            SizedBox(height: 15,),
            MaterialButton(onPressed:Submit_loc , color: Colors.blue, child: Text('submit'),),
          ],
        ),
      ),
    );
  }

}



