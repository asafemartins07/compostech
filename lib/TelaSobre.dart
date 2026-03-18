import 'package:flutter/material.dart';

class TelaSobre1 extends StatefulWidget {
  @override
  State<TelaSobre1> createState() => _TelaSobre();
}

class _TelaSobre extends State<TelaSobre1> {
  Map<String, double> sensorValues = {};
int itemSelecionado = 2;

  @override
  Widget build(BuildContext context) {
    return _telaSobre();
  }
}

Widget _telaSobre(){
  return Scaffold(
    body: ListView(children: [ SizedBox(
      width: double.infinity,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Image.asset('assets/images/Generic avatar.png'),
      Text('SOBRE',
      style: TextStyle(color:Colors.green,
      fontSize: 45,
      fontWeight: FontWeight.w600),
      ),
      Text('INFORMAÇÕES',
       style: TextStyle(color: Colors.blueGrey,
       fontStyle: FontStyle.italic),),
    Container(height: 50,),
    Text('Protótipo desenvolvido para a pesquisa científica da UNIFATEC-PR', 
    style: TextStyle(color: Colors.lightGreen,
    fontWeight: FontWeight.w500),),
    Container(height: 30,),
    Text('Projeto desenvolvido em Dart com o framework em Flutter',
    style: TextStyle(
    fontWeight: FontWeight.w400,),),
    Container(height: 30,),
    Text('Pesquisa e artigo apoiado pelo',), Text('Centro Universitário de Tecnologia de Curitiba (UNIFATEC-PR)',
     style: TextStyle(
        color: Colors.lightGreen,
        fontWeight: FontWeight.w600,
    ),),
    Container(height: 30,),
    Text('Aplicativo desenvolvido por:', style: TextStyle(color: Colors.lightGreen,
    fontWeight: FontWeight.w600,),),
    Text('Asafe Alves Martins', style: TextStyle(),),
    Container(height: 30,),
    Text('Pesquisa desenvolvida por:', style: TextStyle(color: Colors.lightGreen, 
    fontWeight: FontWeight.w600),),
    Text('Ana Júlia dos Santos Teixeira'),
    Text('Asafe Alves Martins'),
    Text('Sara Gabrielle de Oliveira'),
    Container(height: 30,),
    Text('Projeto orientado por: ', style: TextStyle(color: Colors.lightGreen),),
    Text('Prof° Anna Flávia Fogaça'),
    Text('Prof° Lucas Gabriel Muller dos Santos'),
    Container(height: 30,)

    ],))]))
    ;
}
