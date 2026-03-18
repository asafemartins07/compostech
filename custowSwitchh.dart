import 'package:compostech/app_Controle.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Switch(
          value: AppController.instance.DartTheme,
            onChanged: (value){
           AppController.instance.changeTheme();
            }
        );
  }
}
