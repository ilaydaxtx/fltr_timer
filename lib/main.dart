
import 'package:flutter/material.dart';
import 'package:worldtime/pages.dart/chooselocation.dart';
import 'package:worldtime/pages.dart/home.dart';
import 'package:worldtime/pages.dart/loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));

