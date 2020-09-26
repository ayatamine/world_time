import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLoc createState() => _ChooseLoc();
}

class _ChooseLoc extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Algiers', location: 'الجزائر', flag: 'dz.png'),
    WorldTime(url: 'Europe/London', location: 'لندن', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'برلين', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'القاهرة', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'نيروبي', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'نيويورك', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'سيول', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'جاكارتا', flag: 'indonesia.png'),
  ];
  @override
  void initState() {
    super.initState();
  }
  void updateLocation(index) async{
    WorldTime ins =locations[index];
    await ins.getTime();
    Navigator.pop(context,{
      'location':ins.location,
      'flag':ins.flag,
      'time':ins.time,
      'isDayTime':ins.isDayTime
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: AppBar(
         title: Text('اختيار المنطقة'),
         backgroundColor: Colors.blue[500],
         centerTitle: true,
         elevation: 0.0,
       ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                child: Card(
                  child: ListTile(
                    onTap: (){
                      updateLocation(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),

                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
