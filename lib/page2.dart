import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:compostech/TelaSobre.dart';
import 'package:compostech/configurações.dart';


class TelaPrincipal extends StatefulWidget {
  

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _paginaSelecionada = 0;

  // --------- DADOS DOS SENSORES ----------- //

  // 3 DHTs → todos medem apenas temperatura
  double temperaturaDHT1 = 0;
  double temperaturaDHT2 = 0;
  double temperaturaDHT3 = 0;

  // Umidade da composteira (1 DHT)
  double umidadeComposteira = 0;

  // 4 higrômetros da horta
  List<double> umidadesHorta = [0, 0, 0, 0];

  double get umidadeMediaHorta {
    if (umidadesHorta.isEmpty) return 0;
    return umidadesHorta.reduce((a, b) => a + b) / umidadesHorta.length;
  }

  bool _carregando = false;

  // --------- BUSCA OS DADOS DO ESP ----------- //

  Future<void> fetchSensorData() async {
    setState(() {
      _carregando = true;
    });

    try {
      final response = await http.get(Uri.parse('http://192.168.18.154/dados'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          temperaturaDHT1 = (data["dht"]["1"]["temperatura"] ?? 0).toDouble();
  temperaturaDHT2 = (data["dht"]["2"]["temperatura"] ?? 0).toDouble();
  temperaturaDHT3 = (data["dht"]["3"]["temperatura"] ?? 0).toDouble();

  umidadeComposteira = (data["higrometros"]["media"] ?? 0).toDouble();

  umidadesHorta = [
    (data["higrometros"]["h1"] ?? 0).toDouble(),
    (data["higrometros"]["h2"] ?? 0).toDouble(),
    (data['higrometros']["h3"] ?? 0).toDouble(),
    (data["higrometros"]["h4"] ?? 0).toDouble(),
          ];
        });

      } else {
        print("Erro: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro requisição: $e");
    }

    setState(() {
      _carregando = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _paginaSelecionada = index;
    });

    if (index == 1) fetchSensorData();
  }

  // ---------- TELA PRINCIPAL ---------- //

  @override
  Widget build(BuildContext context) {
    List<Widget> paginas = [
      _telaSensores(),
      _telaAtualizar(),
      _telaConfiguracoes(),
      _telaSobre(),
    ];

    return Scaffold(
      body: paginas[_paginaSelecionada],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSelecionada,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.refresh), label: 'Atualizar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Sobre'),
        ],
      ),
    );
  }

  // ----------- TELA DE SENSORES ----------- //

  Widget _telaSensores() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Column(
        children: [
          // ---------------- TEMPERATURAS ----------------
          Text("Temperaturas",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1BAA4A))),
          const SizedBox(height: 20),

          sensorBoxFigma(
            titulo: "Temperatura DHT 1",
            valor: "${temperaturaDHT1.toStringAsFixed(1)}ºC",
            corValor: corTemperatura(temperaturaDHT1),
            icon: iconeTemperatura(temperaturaDHT1),
          ),

          sensorBoxFigma(
            titulo: "Temperatura DHT 2",
            valor: "${temperaturaDHT2.toStringAsFixed(1)}ºC",
            corValor: corTemperatura(temperaturaDHT2),
            icon: iconeTemperatura(temperaturaDHT2),
          ),

          sensorBoxFigma(
            titulo: "Temperatura DHT 3",
            valor: "${temperaturaDHT3.toStringAsFixed(1)}ºC",
            corValor: corTemperatura(temperaturaDHT3),
            icon: iconeTemperatura(temperaturaDHT3),
          ),

          const SizedBox(height: 35),

          // ---------------- UMIDADE ----------------
          Text("Umidades",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1BAA4A))),
          const SizedBox(height: 20),

          sensorBoxFigma(
            titulo: "Umidade da Composteira",
            valor: "${ temperaturaDHT3.toStringAsFixed(0)}%",
            corValor: corUmidadeDHT( temperaturaDHT3),
            icon: umidadeDHT( temperaturaDHT3),
          ),

          sensorBoxFigma(
            titulo: "Umidade do Solo (Média de 4 Higrômetros)",
            valor: "${umidadeMediaHorta.toStringAsFixed(0)}",
            corValor: corUmidade(umidadeMediaHorta),
            icon: iconeUmidade(umidadeMediaHorta),
          ),
        ],
      ),
    );
  }

  // ----------- OUTRAS TELAS ----------- //

  Widget _telaAtualizar() {
    return Center(
      child: _carregando
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: fetchSensorData,
              child: Text("Atualizar dados"),
            ),
    );
  }

  Widget _telaConfiguracoes() {
    return Confi();
  }

  Widget _telaSobre() {
    return TelaSobre1();
  }

  // ----------- CORES E ÍCONES ----------- //

  Color corTemperatura(double t) {
    if (t <= 22) return Colors.green;
    if (t < 30) return Colors.orange;
    return Colors.red;
  }

  String? iconeTemperatura(double t) {
    if (t > 22 && t < 30) return "assets/images/bandeira.png";
    if (t >= 30) return "assets/images/alerta.png";
    return null;
  }

  Color corUmidade(double u) {
    if (u <= 350) return Colors.green;
    if (u <= 400) return Colors.orange;
    return Colors.red;
  }

  String? iconeUmidade(double u) {
    if(u < 350) return  null;
    if (u < 450) return "assets/images/alerta.png";
    if (u < 600) return "assets/images/bandeira.png";
    return null;
  }
   String? umidadeDHT(double u) {
    if(u > 65) return  null;
    if (u < 20) return "assets/images/alerta.png";
    if (u < 64)return "assets/images/bandeira.png";
    return null;
  }
  Color corUmidadeDHT(double u) {
    if (u >= 65) return Colors.green;
    if (u >= 40) return Colors.orange;
    return Colors.red;
}

// ----------- COMPONENTE SENSOR BOX ----------- //

Widget sensorBoxFigma({
  required String titulo,
  required String valor,
  required Color corValor,
  String? icon,
}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    decoration: BoxDecoration(
      color: const Color(0xFFFEF7FF),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Image.asset(icon, height: 24),
              ),
            Flexible(
              child: Text(
                titulo,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          valor,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: corValor,
          ),
        ),
      ],
    ),
  );
}
}
