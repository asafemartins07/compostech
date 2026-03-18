import 'package:compostech/app_Controle.dart';
import 'package:compostech/entrada.dart';
import 'package:compostech/page2.dart';
import 'package:flutter/material.dart';
import 'package:compostech/TelaSobre.dart';

class MyApp extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child){
      return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red,
      brightness: AppController.instance.DartTheme ? Brightness.dark: Brightness.light,
      ),
      initialRoute: '/entrada',
      routes: {

       '/entrada': (context) => EntraPage(),
        '/Page2': (context) => TelaPrincipal(),
        '/TelaSobre': (context) => TelaSobre1()
        

      },
    );
    });
  }
}