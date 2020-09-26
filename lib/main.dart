import 'package:flutter/material.dart';
import 'package:worldtime/pages/home.dart';
import 'package:worldtime/pages/loading.dart';
import 'package:worldtime/pages/choose_location.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/':(context)=> LoadingScreen(),
    '/Home':(context) => Home(),
    '/Location' : (context) => ChooseLocation()
  },
  builder: (context,child){
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child,
    );
  },
));

