import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime {
  String url,location,time,flag;
  bool isDayTime ;
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async{
    try {
      Response response = await get(
          'http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      String date_time = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a date time
      DateTime now = DateTime.parse(date_time);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    }
    catch(e){
      time = 'لايوجد أي نتيجة';
    }
  }
}