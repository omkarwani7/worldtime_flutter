import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location; //location name for the UI
  late String time; //the time in that location
  late String flag; //url to an asset flag icon
  late String url; //location url for api endpoint
  bool isDaytime = true; //true or false if day time or not

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      var url = Uri.parse('http://worldclockapi.com/api/json/est/now');
      var response = await http.get(url);
      Map data = jsonDecode(response.body);
      String datetime = data['currentDateTime'];
      String offset = data['utcOffset'].substring(1, 4);
      // print('currentDateTime');
      // print('utcOffset');
      print(data);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now); //set the time property
    } catch (e) {
      print('caught error: $e');
      time = 'Could not get data';
    }
  }
}
