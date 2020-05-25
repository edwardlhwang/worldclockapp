import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String  time; //time in this location
  String flag; //url to asset flag icon
  String url; //url to country location

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async { //add future here so this function can be called by async function

    try {
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //get properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      print('$dateTime - $offset');

      //create DateTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: (int.parse(offset))));
      time = now.toString();
    }  catch (e) {
      time = 'could not get time data';
    }
  }
}

