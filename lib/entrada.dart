import 'package:flutter/material.dart';

class EntraPage extends StatefulWidget {
  @override
  EntraState createState() => EntraState();
}

class EntraState extends State<EntraPage> {
  Widget _body() {
    return ListView(
      children: [
        SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 180),

              // ===== TÍTULO ACIMA DA IMAGEM =====
              Text(
                "COMPOSTech",
                style: TextStyle(
                  color: Colors.green.shade900,
                  fontSize: 32,
                  fontWeight: FontWeight.w900, // NEGRITO FORTE
                ),
              ),

              const SizedBox(height: 20),

              // ===== IMAGEM PRINCIPAL =====
              Image.asset(
                'assets/images/image 2.png',
                height: 150,
                width: 150,
              ),

              const SizedBox(height: 20),

            
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/Page2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // fundo branco
                  foregroundColor: Colors.green, // texto verde
                  side: const BorderSide(color: Colors.green), // borda verde
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 12,
                  ),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontWeight: FontWeight.bold), // NEGRITO
                ),
              ),

              const SizedBox(height: 15),

              
             
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ===== FUNDO PREENCHENDO TUDO =====
          SizedBox.expand(
            child: Image.asset(
              'assets/images/TELA 01.png',
              fit: BoxFit.cover,
            ),
          ),

          // ===== CONTEÚDO =====
          _body(),
        ],
      ),
    );
  }
}
