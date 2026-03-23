import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercício 6"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.network(
                'https://images.unsplash.com/photo-1585747860715-2ba37e788b70',
                height: 200,
              ),

              SizedBox(height: 20),

              Text(
                "Barbearia Style\nCorte, barba e estilo profissional",
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  print("Você clicou no botão!");
                },
                child: Text("Agendar Horário"),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}