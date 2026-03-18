import 'package:flutter/material.dart';

class AppController extends ChangeNotifier {
  static AppController instance =AppController(); 
  bool DartTheme = false;
  changeTheme(){
    DartTheme = !DartTheme;
    notifyListeners();}
}
