import 'dart:async';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SplashScreen(),

  ));
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();

  
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem vindo ao Meu App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16,),
            Text(
              'Seu destino para uma experiencia incrivel!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,

              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController num1Controller = TextEditingController();
    TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora MMC"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Primeiro número",
              ),
            ),

            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Segundo número",
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15)
              ),

              onPressed: () {
                int num1 = int.parse(num1Controller.text);
                int num2 = int.parse(num2Controller.text);

                int resultado = calcularMMC(num1, num2);

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Resultado"),
                      content: Text("MMC: $resultado"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text("Calcular MMC"),
            ),
          ],
        ),
      ),
    );
  }
}

int calcularMMC(int a, int b) {
  int maior = a > b ? a : b;
  int mmc = maior;

  while (true) {
    if (mmc % a == 0 && mmc % b == 0) {
      return mmc;
    }
    mmc += maior;
  }
}