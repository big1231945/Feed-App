// import 'package:feed_app/FirebaseRealtimeDemoScreen.dart';
import 'package:feed_app/screens/menu.dart';
import 'package:feed_app/screens/menu/start.dart';
import 'package:feed_app/screens/setiingapp.dart';
import 'package:flutter/material.dart';
import 'package:feed_app/screens/home.dart';


final Map<String, WidgetBuilder> map ={
  '/home':(BuildContext context)=> home(),
  '/menu':(BuildContext context)=> menu(),
  '/start':(BuildContext context)=> Start()
};