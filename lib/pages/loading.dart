import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingSc createState() => _LoadingSc();
}

class _LoadingSc extends State<LoadingScreen> {
  void setupWorldTime() async {
    WorldTime ins = WorldTime(location: 'الجزائر',flag: 'dz.png',url: 'Africa/Algiers');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/Home',arguments: {
      'location':ins.location,
      'flag':ins.flag,
      'time':ins.time,
      'isDayTime':ins.isDayTime
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:EdgeInsets.all(30.0),
          child: SpinKitFadingCube(
            color: Colors.blue[700],
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
