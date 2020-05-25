import 'package:flutter/material.dart';
import 'package:pagedapp/pages/home.dart';
import 'package:pagedapp/pages/loading.dart';
import 'package:pagedapp/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

