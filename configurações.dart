import 'package:compostech/custowSwitchh.dart';
import 'package:flutter/material.dart';

class Confi extends StatefulWidget {
  

  @override
  State<Confi> createState() => _ConfiState();
}

class _ConfiState extends State<Confi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
      
        children: [
          Card(
           child: Row(
            children: [
          Text(" Claro ou escuro: ",
          style: TextStyle(fontSize: 20),),
          CustomSwitch(),]))
          
      

        ],
        
      ));
    
  }
}